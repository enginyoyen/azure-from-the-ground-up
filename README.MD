# Azure From Ground Up
This repository contains bicep codes to create various infrastructure.

## Code Structure
#### `modules` directory
All bicep modules are located under `modules` directory, modules are used for encapsulating complex details of the deployment. For instance, `vnet.bicep` module is used to create `Azure Virtual Network (VNet)`, and it can be used in combination of different infrastructure pieces, in this example, it is used for creating a VNet for AKS. So modules are there to create a reusable deployment code.


#### `.bicep`, `.json`,`.md` files
The code is organized in based on use-cases, consider `BuildStorage`. It creates an `Azure Container Registry` in an isolated resource group. There are three files called `BuildStorage` with different extension:

```
BuildStorage.md     : Contains what the use-case is about and how to execute it. 
BuildStorage.bicep  : The actual infrastructure code.
BuildStorage.json   : All the parameters that are injected in to the bicep code.
```


## Licence
Use of this source code is governed by an MIT license that can be found in the LICENSE file.
