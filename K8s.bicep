@minLength(2)
@maxLength(10)
@description('Prefix for all resource names.')
param prefix string = 'ex'

param sshRSAPublicKey string

param linuxAdminUsername string

param aksClusterName string

param azureActiveDirectoryGroupObjectIDs string

@description('Azure region used for the deployment of all resources.')
param location string = resourceGroup().location

var name = toLower('${prefix}')

// Create a short, unique suffix, that will be unique to each resource group
var uniqueSuffix = substring(uniqueString(resourceGroup().id), 0, 4)


// Virtual network and network security group
module nsg 'modules/nsg.bicep' = { 
  name: 'nsg-${name}-${uniqueSuffix}-deployment'
  params: {
    location: location
    nsgName: 'nsg-${name}-${uniqueSuffix}'
  }
}

module vnet 'modules/vnet.bicep' = { 
  name: 'vnet-${name}-${uniqueSuffix}'
  params: {
    location: location
    virtualNetworkName: 'vnet-${name}-${uniqueSuffix}'
    networkSecurityGroupId: nsg.outputs.networkSecurityGroup
  }
}

module logWorkspace 'modules/log-analytics.bicep' = {
  name: 'logworkspace'
  params: {
    prefix: prefix
  }
}

module aks 'modules/aks.bicep' = {
  name: 'kubernetesCluster'
  params: {
    clusterName: aksClusterName
    location: location
    vnetSubnetID: vnet.outputs.subnetId
    logWorkspaceId: logWorkspace.outputs.logWorkspaceId
    dnsPrefix: prefix
    sshRSAPublicKey: sshRSAPublicKey
    linuxAdminUsername: linuxAdminUsername
    azureActiveDirectoryGroupObjectIDs: azureActiveDirectoryGroupObjectIDs
  }
}
