targetScope='subscription'

param resourceGroupName string
param resourceGroupLocation string
param containerRegistryName string

resource newRG 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: resourceGroupName
  location: resourceGroupLocation
}

module registery 'modules/acr.bicep'  = {
  name: 'acr'
  scope: newRG
  params: {
    registryName: containerRegistryName
  }
}
