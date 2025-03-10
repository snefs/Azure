# AzureContent
Public content aimed to help with Azure challenges. 


:toc:


# Project phases and supporting tools - frameworks
| Phase        | Activity                  | Deliverable                           | Tools/Frameworks                                                                                                                                                                                                                                                                                                                                                                                                                    |
| ------------ | ------------------------- | ------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Adoption     | Onboard customer to Azure | Azure Foundation                      | [https://github.com/lukemurraynz/awesome-azure-architecture](https://github.com/lukemurraynz/awesome-azure-architecture)                                                                                                                                                                                                                                                                                                            |
| Architecture | As-is                     | Architecture review                   | [Global: https://learn.microsoft.com/en-us/assessments/azure-architecture-review/ & https://github.com/microsoft/ARI<br>Azure: https://azure.github.io/azqr/<br>Security: https://microsoft.github.io/zerotrustassessment/docs/app-permissions](https://learn.microsoft.com/en-us/assessments/azure-architecture-review/)                                                                                                           |
| Architecture | To-Be                     | Strategy<br>Architecture design       | [https://learn.microsoft.com/en-us/azure/well-architected/<br>https://learn.microsoft.com/en-us/azure/architecture/browse/<br><br>Enterprise tool<br>Bluedolphin<br>Enterprise Architect<br>BrainBoard.co<br><br>Free Tools<br>www.drawio.com<br>https://azurediagrams.com/VrZcsDMQ<br>https://diagrams.mingrammer.com/](https://learn.microsoft.com/en-us/azure/well-architected/)                                                 |
| Foundation   | Roadmap                   | Roadmap - Goals/Principles/Guidelines | [https://github.com/mspnp/AzureNamingTool](https://github.com/mspnp/AzureNamingTool)                                                                                                                                                                                                                                                                                                                                                |
| Foundation   | Design patterns           | Design patterns                       | [https://github.com/mspnp/cloud-design-patterns](https://github.com/mspnp/cloud-design-patterns)                                                                                                                                                                                                                                                                                                                                    |
| Foundation   | Technical foundation      | Azure landing zones                   | [https://learn.microsoft.com/nl-nl/azure/cloud-adoption-framework/ready/landing-zone/#azure-landing-zone-accelerator<br>https://learn.microsoft.com/nl-nl/azure/architecture/landing-zones/landing-zone-deploy](https://learn.microsoft.com/nl-nl/azure/cloud-adoption-framework/ready/landing-zone/#azure-landing-zone-accelerator)                                                                                                |
| Platform     | Technical building blocks | Azure (Integration) Services / Ops    | [https://pacodelacruz.io/enterprise-integration-patterns-on-azure-intro<br>OPS: FinOps toolkit - Kick start your FinOps efforts](https://pacodelacruz.io/enterprise-integration-patterns-on-azure-introOPS:%20FinOps%20toolkit%20-%20Kick%20start%20your%20FinOps%20efforts)                                                                                                                                                        |
| Platform     | Workloads                 | Data / Integration / Apps             | [https://dev.to/prateeksingh/azure-visualizer-automated-diagrams-using-powershell-1m95<br>[Orphaned Resources](https://github.com/dolevshor/azure-orphan-resources)<br>[Azure Checklists](https://github.com/Azure/review-checklists)<br>[FinOps](https://learn.microsoft.com/en-us/cloud-computing/finops/toolkit/finops-toolkit-overview)](https://dev.to/prateeksingh/azure-visualizer-automated-diagrams-using-powershell-1m95) |

# Project technical decisions with long term impact
| Key decisions                   | Examples                                                        | Based on                                     |
| ------------------------------- | --------------------------------------------------------------- | -------------------------------------------- |
| Cloud platform selection        | Public (Azure/AWS/GCP), Region (Scaleway, etc)                  | Market / Costs / In house-external expertise |
| Integration platform - patterns | Buy vs Build / Low code vs High Code vs On premise-Cloud-Hybrid | In house-external expertise                  |
| Code Repository                 | Azure Git / GitHub / other                                      | In house-external expertise                  |
| Workload / tasks management     | Azure DevOps / GitHub / Confluence / other                      | In house-external expertise                  |
| IaC Language                    | Terraform vs OpenTufo vs Bicep vs Pulumi                        | In house-external expertise                  |
| IaC Pipeline                    | BrainBoard vs Azure Devops                                      | In house-external expertise                  |




# Courses
- [AI for Beginners (this one](https://github.com/microsoft/ai-for-beginners)
- [Data Science for Beginners](https://github.com/microsoft/Data-Science-For-Beginners)
- [IoT for Beginners](https://github.com/microsoft/IoT-For-Beginners)
- [Mastering GitHub Copilot for AI Paired Programming](https://github.com/microsoft/Mastering-GitHub-Copilot-for-Paired-Programming?WT.mc_id=academic-113596-abartolo)
- [ML for Beginners](https://github.com/microsoft/ML-For-Beginners?WT.mc_id=academic-105485-koreyst)
- [NEW Cybersecurity for Beginners](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)
- [Web Dev for Beginners](https://github.com/microsoft/Web-Dev-For-Beginners?WT.mc_id=academic-0000-abartolo)
- [XR Development for Beginners](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)
  



# Recipes for specific problems

## Infrastructure as code
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
