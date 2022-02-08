# Creates a kubernetes cluster 
Creates a kubernetes cluster including:
* vnet
* subnet
* nsg
* log analytics workspace
* Azure Active Directory integration

## Execute
To create the cluster you need a resource-group first, if you have one skip this step. 

````
az group create -g k8sCluster --location northeurope
````

For your cluster, you need an Azure AD group, this is used to integrate AKS with Azure AD.
If you have an existing admin group, retrieve the object-id, if not create one with the following command, and add the object ID into the `K8s.json`:

````
az ad group create --display-name myAKSAdminGroup --mail-nickname myAKSAdminGroup
````


Create a kubernetes cluster

```
az deployment group create --resource-group k8sCluster --template-file K8s.bicep --parameters K8s.json
```

