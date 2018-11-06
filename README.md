
# Terraform Module for creating a least privileges role for an AKS Service Principle in Azure

[![CircleCI](https://circleci.com/gh/CalvinRodo/terraform-azurerm-aks-role.svg?style=svg)](https://circleci.com/gh/CalvinRodo/terraform-azurerm-aks-role)


Usage: 

```hcl
module "role" { 
  source: "CalvinRodo/aks-role/azurerm"
  version: "1.0.1"
  role_name: "Service-Principle-Name"
}
```

Based off of the following Repo: 
https://github.com/lawrencegripper/azure-aks-terraform