resource "azurerm_express_route_circuit" "this" {
  name                     = var.name
  location                 = var.location
  resource_group_name      = var.resource_group_name
  service_provider_name    = var.service_provider_name
  peering_location         = var.peering_location
  bandwidth_in_mbps        = var.bandwidth_in_mbps
  allow_classic_operations = var.allow_classic_operations

  sku {
    tier   = var.sku.tier
    family = var.sku.family
  }

  tags = var.tags
}

resource "azurerm_virtual_network_gateway_connection" "this" {
  count = var.gateway_connection == null || !try(var.gateway_connection.enabled, false) ? 0 : 1

  name                = var.gateway_connection.name
  location            = var.location
  resource_group_name = var.resource_group_name

  type                         = "ExpressRoute"
  virtual_network_gateway_id   = var.gateway_connection.virtual_network_gateway_id
  express_route_circuit_id     = azurerm_express_route_circuit.this.id
  authorization_key            = try(var.gateway_connection.authorization_key, null)
  routing_weight               = try(var.gateway_connection.routing_weight, null)
  express_route_gateway_bypass = try(var.gateway_connection.express_route_gateway_bypass, false)
}
