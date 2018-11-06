output "aks_role_name" {
  description = "Name of the generated role"
  value       = "${azurerm_role_definition.aks_sp_role_rg.name}"
}
