@description('Azure region of the deployment')
param location string

@description('Name of the network security group')
param nsgName string

resource nsg 'Microsoft.Network/networkSecurityGroups@2021-02-01' = {
  name: nsgName
  location: location
  properties: {
    securityRules: [
    ]
  }
}
output networkSecurityGroup string = nsg.id
