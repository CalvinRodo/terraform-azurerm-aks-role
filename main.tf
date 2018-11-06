data "azurerm_subscription" "sub" {}

// Attempt to create a 'least privilidge' role for SP used by AKS
resource "azurerm_role_definition" "aks_sp_role_rg" {
  name        = "aks_sp_role"
  scope       = "${data.azurerm_subscription.sub.id}"
  description = "This role provides the required permissions needed by Kubernetes to: Manager VMs, Routing rules, Mount azure files and Read container repositories"

  permissions {
    actions = [
      "Microsoft.Compute/virtualMachines/read",
      "Microsoft.Compute/virtualMachines/write",
      "Microsoft.Compute/disks/write",
      "Microsoft.Compute/disks/read",
      "Microsoft.Network/loadBalancers/write",
      "Microsoft.Network/loadBalancers/read",
      "Microsoft.Network/routeTables/read",
      "Microsoft.Network/routeTables/routes/read",
      "Microsoft.Network/routeTables/routes/write",
      "Microsoft.Network/routeTables/routes/delete",
      "Microsoft.Storage/storageAccounts/fileServices/fileShare/read",
      "Microsoft.ContainerRegistry/registries/read",
      "Microsoft.Network/publicIPAddresses/read",
      "Microsoft.Network/publicIPAddresses/write",
    ]

    not_actions = [
      // Deny access to all VM actions, this includes Start, Stop, Restart, Delete, Redeploy, Login, Extensions etc
      "Microsoft.Compute/virtualMachines/*/action",

      "Microsoft.Compute/virtualMachines/extensions/*",
    ]
  }

  assignable_scopes = [
    "${data.azurerm_subscription.sub.id}",
  ]
}
