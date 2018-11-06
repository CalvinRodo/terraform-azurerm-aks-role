
# Terraform Module for creating a least privileges role for an AKS Service Principle in Azure

[![CircleCI](https://circleci.com/gh/CalvinRodo/terraform-azurerm-aks-role.svg?style=svg)](https://circleci.com/gh/CalvinRodo/terraform-azurerm-aks-role)


Usage: 

```hcl
module "sp" { 
  source: "git@github.com:CalvinRodo/az-service-principle-tf"
  sp_name: "Service-Principle-Name"
}
```

Based off of the following Repo: 
https://github.com/lawrencegripper/azure-aks-terraform