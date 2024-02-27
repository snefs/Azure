# AzureContent
Public content aimed to help for Azure challenges

Please contact me for the latest version

# Governance
- [Orphaned Resources](https://github.com/dolevshor/azure-orphan-resources)
-  [Azure Checklists](https://github.com/Azure/review-checklists)

# Infrastructure as code

- [Azure verified modules](https://azure.github.io/Azure-Verified-Modules/)

## CARMLUpgrade.ps1 (upon request can be shared)
- added bicep CARML upgrade script for the old structure (Feb 2023) -> to the latest structure (Feb 2024)
- Note that Bicep is undergoing changes towards Azure Verified Modules
- Note tha this script only corrects the structure, not the content
  
Changes:
- Plural to single (policies --> policy)
- Microsoft.AAD --> AAD
- Deploy.bicep --> Main.bicep
- Pascal case to '-' dash separated lower case (e.g. DataFactory --> data-factory
