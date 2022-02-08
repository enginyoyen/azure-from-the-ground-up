# Create a Azure Container Registry in an isolated resource group
Purpose is to add all containers in a single ACR and be able to delete all other resource groups without touching the ACR. 

Keeping ACR in a different resource-group gives addtional benefit of better control, security check and isolation.

## Execute
To deploy the ACR with resource-group, execute the following code. Change parameters in the `BuildStorage.json` for chancing the name of the resource-group and/or ACR.

```
az deployment sub create --location westeurope --template-file BuildStorage.bicep --parameters BuildStorage.json
```
