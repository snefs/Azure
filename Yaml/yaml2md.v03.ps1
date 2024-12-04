<#
.SYNOPSIS
    Converts Azure Pipeline YAML to markdown documentation.
.DESCRIPTION
    Generates markdown documentation from Azure Pipeline YAML with sections for:
    - Resources (with subheaders and bullet lists)
    - Parameters (2-column table)
    - Pool (bullet list)
    - Variables (table)
    - Stages (hierarchical with code blocks for inline scripts)
#>

param(
    [Parameter(Mandatory = $true)]
    [string]$YamlPath,
    [Parameter(Mandatory = $true)]
    [string]$OutputPath,
    [Parameter(Mandatory = $false)]
    [string]$KeywordsPath
)

# Install and import PowerShell-Yaml if not already present
if (-not (Get-Module -ListAvailable -Name powershell-yaml)) {
    Install-Module -Name powershell-yaml -Force -Scope CurrentUser
}
Import-Module powershell-yaml

# Load keywords file if provided
$keywords = @{}
if ($KeywordsPath -and (Test-Path $KeywordsPath)) {
    $keywords = Get-Content $KeywordsPath -Raw | ConvertFrom-Json -AsHashtable
}

function Get-Description {
    param([string]$keyword)
    if ($keywords.ContainsKey($keyword)) {
        return "`n> $($keywords[$keyword])`n`n"
    }
    return ""
}

# Read and parse YAML
$yamlContent = Get-Content $YamlPath -Raw
$pipeline = ConvertFrom-Yaml $yamlContent

# Initialize markdown content
$markdown = @"
# Azure Pipeline Documentation

[[_TOC_]]

## Highlights

- [Resources](#resources)
- [Parameters](#parameters)
- [Pool](#pool)
- [Variables](#variables)
- [Stages](#stages)

"@

# Resources section
$markdown += "`n# Resources`n"
$markdown += Get-Description -keyword "resources"

if ($pipeline.resources) {
    foreach ($resourceType in $pipeline.resources.PSObject.Properties) {
        if ($resourceType.Name -eq "Values") {
            $markdown += "`n### $($resourceType.Name)`n"
            $markdown += Get-Description -keyword "resources.$($resourceType.Name.ToLower())"
            foreach ($resource in $resourceType.Value) {
                if ($resource.Name -notin "Capacity", "Count", "IsReadOnly", "IsFixedSize", "SyncRoot", "System.Collections.Hashtable", "IsSynchronized") {
                    $markdown += "<details>`n<summary>$($resource.Name)</summary>`n`n"
                    $markdown += "- **$($resource.Name)**: $($resource.Value)`n"
                    foreach ($prop in $resource.PSObject.Properties) {
                        if ($prop.Name -notin "Capacity", "Count", "IsReadOnly", "IsFixedSize", "SyncRoot", "System.Collections.Hashtable", "IsSynchronized") {
                            $markdown += "- **$($prop.Name)**: $($prop.Value)`n"
                        }
                    }
                    $markdown += "`n</details>`n"
                }
            }
        }
    }
}

# Parameters section
$markdown += "`n# Parameters`n"
$markdown += Get-Description -keyword "parameters"

if ($pipeline.parameters) {
    $markdown += "| Name | Value |`n|------|-------|`n"
    foreach ($param in $pipeline.parameters) {
        $markdown += "| $($param.name) | $($param.default) |`n"
    }
}

# Pool section
$markdown += "`n# Pool`n"
$markdown += Get-Description -keyword "pool"

if ($pipeline.pool) {
    foreach ($prop in $pipeline.pool.PSObject.Properties) {
        if ($prop.Name -eq "Values") {
            $markdown += "- **Name**: $($prop.Value)`n"
        }
    }
}

# Variables section
$markdown += "`n# Variables`n"
$markdown += Get-Description -keyword "variables"

if ($pipeline.variables) {
    $markdown += "| Name | Value |`n|------|-------|`n"
    foreach ($var in $pipeline.variables) {
        $markdown += "| $($var.name) | $($var.value) |`n"
    }
}

# Stages section
$markdown += "`n# Stages`n"
$markdown += Get-Description -keyword "stages"

if ($pipeline.stages) {
    foreach ($stage in $pipeline.stages) {
        # Stage header
        $markdown += "`n## Stage: $($stage.stage)`n"
        if ($stage.displayName) {
            $markdown += "**Display Name**: $($stage.displayName)`n`n"
        }

        # Stage variables
        if ($stage.variables) {
            $markdown += "Variables`n`n"
            $markdown += Get-Description -keyword "variables"
            $markdown += "| Name | Value |`n|------|-------|`n"
            foreach ($var in $stage.variables) {
                if ($var -is [System.Management.Automation.PSCustomObject]) {
                    $markdown += "| $($var.name) | $($var.value) |`n"
                }
            }
        }

        # Jobs and steps
        if ($stage.jobs) {
            foreach ($job in $stage.jobs) {
                $markdown += "### Job: $($job.job)`n"
                $markdown += Get-Description -keyword "jobs.job"
                $markdown += "**Display Name**: $($job.displayName)`n`n"

                if ($job.steps) {
                    $markdown += "Steps`n`n"
                    $markdown += Get-Description -keyword "steps"

                    $markdown += "| Task | Detail |`n|------|-------|`n"
                    foreach ($step in $job.steps) {
                        if ($step.displayName) {
                            $markdown += "| $($step.task) | $($step.displayName) |`n"
                        }
                        else {
                            $markdown += "| $($step.task) |  |`n"
                        }
                    }
                    $markdown += "`n"
                }
            }
        }
    }
}

# Write markdown to file
$markdown | Out-File -FilePath $OutputPath -Encoding UTF8
Write-Host "Documentation generated successfully at: $OutputPath"