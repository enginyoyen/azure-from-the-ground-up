
param registryName string

resource containerRegistry 'Microsoft.ContainerRegistry/registries@2021-09-01'  = {
  name: registryName
  location: resourceGroup().location
  sku: {
    name: 'Basic'
  }
  properties: {
    adminUserEnabled: false
  }
}
