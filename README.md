# AzureContent
Public content aimed to help for Azure challenges

# Architecture
- ## [azurediagrams](https://azurediagrams.com/)
- ## [mingrammer](https://github.com/mingrammer/diagrams)
- ## [Azure visualizer](https://dev.to/prateeksingh/azure-visualizer-automated-diagrams-using-powershell-1m95)

# Governance
- [Orphaned Resources](https://github.com/dolevshor/azure-orphan-resources)
-  [Azure Checklists](https://github.com/Azure/review-checklists)

# Infrastructure as code

## [Azure verified modules](https://azure.github.io/Azure-Verified-Modules/)

- [CARML Upgrade script](https://github.com/snefs/Azure/blob/main/Bicep/CARMLUPgrade.ps1) (can be discussed upon request)
  - added bicep CARML upgrade script for the old structure (Feb 2023) -> to the latest structure (Feb 2024)
  - Note that Bicep is undergoing changes towards Azure Verified Modules
  - Note tha this script only corrects the structure, not the content
  
  Changes:
  - Plural to single (policies --> policy)
  - Microsoft.AAD --> AAD
  - Deploy.bicep --> Main.bicep
  - Pascal case to '-' dash separated lower case (e.g. DataFactory --> data-factory


# News
[NotebookLM Ignite2024_BookofNews](https://github.com/snefs/Azure/blob/audio/main/ignite2024_bookofnews.mp3)

