# AzureContent
Public content aimed to help for Azure challenges

# Courses
- [AI for Beginners (this one](https://github.com/microsoft/ai-for-beginners)
- [Data Science for Beginners](https://github.com/microsoft/Data-Science-For-Beginners)
- [IoT for Beginners](https://github.com/microsoft/IoT-For-Beginners)
- [Mastering GitHub Copilot for AI Paired Programming](https://github.com/microsoft/Mastering-GitHub-Copilot-for-Paired-Programming?WT.mc_id=academic-113596-abartolo)
- [ML for Beginners](https://github.com/microsoft/ML-For-Beginners?WT.mc_id=academic-105485-koreyst)
- [NEW Cybersecurity for Beginners](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)
- [Web Dev for Beginners](https://github.com/microsoft/Web-Dev-For-Beginners?WT.mc_id=academic-0000-abartolo)
- [XR Development for Beginners](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)
  
# Architecture
Several links that can help defining / documenting architectural high level diagrams
- ## [azurediagrams](https://azurediagrams.com/)
- ## [mingrammer](https://github.com/mingrammer/diagrams)
- ## [Azure visualizer](https://dev.to/prateeksingh/azure-visualizer-automated-diagrams-using-powershell-1m95)

# Governance
Several links that help you maintain/manage your Azure environment  
- [Orphaned Resources](https://github.com/dolevshor/azure-orphan-resources)
- [Azure Checklists](https://github.com/Azure/review-checklists)
- [FinOps](https://learn.microsoft.com/en-us/cloud-computing/finops/toolkit/finops-toolkit-overview)


# Infrastructure as code
Several initiatives that could help getting around common challenges

### Blogs
[PSDocs](https://www.linkedin.com/pulse/documenting-bicep-psdocs-psbicep-sander-nefs-azure-integration--pznhe/)
[PowerShell to deploy Search](https://www.linkedin.com/pulse/deploying-azure-ai-search-artefacts-index-indexer-sander-usioe/?trackingId=WsQ5kz1PTxGqMmVXytwonw%3D%3D)


## Document Yaml pipelines (only tested with Azure Devops)

Script that can generate (simple) documentation from your Azure DevOps Yaml pipeline. It will describe the parameters/variables and per stage all the used steps/jobs/tasks.
Each type of activity is described using a description defined in keywords.json.

Additional features that could be added:
- Multi language support for keywords
- Description tag of yaml

- Preparation steps
  - Retrieve entire Yaml
    - 1. Run a pipeline
    - 2. Download logs
    - 3. Look for azure-pipelines-expanded.yaml
         
  note: You can expand this script by using the Yaml schema, this is however a schema that I couldn't get prompted, this is why the keywords.json is used for descriptions. 
  Retrieve your organization schema: https://dev.azure.com/<YOURORG>/_apis/distributedtask/yamlschema

- Generation steps
[Script (5-dec-2024: yaml2md.v03.ps1](https://github.com/snefs/Azure/blob/main/Yaml)

  - Run this script (without parameters):
    - .\yaml2md.v03.ps1

  - Run this script (with parameters):
    - .\yaml2md.v03.ps1 -YamlPath "mycoolpipeline.yaml" -OutputPath "pipeline-documentation.md" -KeywordsPath "keywords.json"

## [Azure verified modules](https://azure.github.io/Azure-Verified-Modules/)
Script that helps to migrate from CARML to AVD (mainly prepares the structure - note that this is time specific - this version might be suited at the moment you are working on this) 

- [CARML Upgrade script](https://github.com/snefs/Azure/blob/main/Bicep/CARMLUPgrade.ps1) (can be discussed upon request)
  - added bicep CARML upgrade script for the old structure (Feb 2023) -> to the latest structure (Feb 2024)
  - Note that Bicep is undergoing changes towards Azure Verified Modules
  - Note tha this script only corrects the structure, not the content
  
  Changes:
  - Plural to single (policies --> policy)
  - Microsoft.AAD --> AAD
  - Deploy.bicep --> Main.bicep
  - Pascal case to '-' dash separated lower case (e.g. DataFactory --> data-factory


# Audio

[Audio files](./Audio/Audiofiles.md)
