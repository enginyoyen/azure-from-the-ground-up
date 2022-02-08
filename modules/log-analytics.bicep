param prefix string

resource lw 'Microsoft.OperationalInsights/workspaces@2021-06-01' = {
  name: '${prefix}-workspace'
  location: resourceGroup().location
}

output logWorkspaceId string = lw.id
