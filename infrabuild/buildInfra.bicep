param location string = resourceGroup().location
param clusterName string = 'adx-karg-build'
param databaseName string = 'dfir'
param scriptDefineSchemasAndMappings string = 'defineschemas'


@description('Create the adx/kusto cluster')
resource cluster 'Microsoft.Kusto/clusters@2023-08-15' = {
  name: clusterName
  location: location
  sku: {
    name: 'Dev(No SLA)_Standard_E2a_v4'
    tier: 'Basic'
    capacity: 1
  }
}

resource database 'Microsoft.Kusto/clusters/databases@2023-08-15' = {
  name: databaseName
  location: location
  kind: 'ReadWrite'
  properties: {
    hotCachePeriod: 'P90D'
    softDeletePeriod: 'P150D'
  }
  parent: cluster
  // For remaining properties, see clusters/databases objects
}

resource script1 'Microsoft.Kusto/clusters/databases/scripts@2023-08-15' = {
  name: scriptDefineSchemasAndMappings
  parent: database
  properties: {
    continueOnErrors: false
    scriptContent: loadTextContent('defineSchemas.kql')
  }
}

