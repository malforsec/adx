##How to build the infra

#prereqs to use azure PS, Bicep cli and connect to Azure:
https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/deploy-powershell

#Azure PS:
Start the bicep and it will build the ADX cluster, create tables and define ingestionmappings
New-AzResourceGroupDeployment -ResourceGroupName <resource-group-name> -TemplateFile <path-to-bicep>
