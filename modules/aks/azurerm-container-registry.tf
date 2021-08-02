resource "azurerm_container_registry" "aks" {
  name = "${local.prefix}${var.suffix}"
  resource_group_name = var.resource_group.name
  location =  var.resource_group.location
  sku = "Premium"
  admin_enabled = true
}

resource "azurerm_role_assignment" "example" {
  scope                = azurerm_container_registry.aks.id
  role_definition_name = var.acrRole
  principal_id         = azurerm_kubernetes_cluster.dev.kubelet_identity[0].object_id
}
