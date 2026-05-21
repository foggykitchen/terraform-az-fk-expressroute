output "circuit_id" {
  description = "ExpressRoute circuit resource ID."
  value       = azurerm_express_route_circuit.this.id
}

output "circuit_name" {
  description = "ExpressRoute circuit name."
  value       = azurerm_express_route_circuit.this.name
}

output "service_key" {
  description = "ExpressRoute service key used by partner connectivity providers."
  value       = azurerm_express_route_circuit.this.service_key
  sensitive   = true
}

output "gateway_connection_id" {
  description = "Virtual Network Gateway connection ID when created."
  value       = try(azurerm_virtual_network_gateway_connection.this[0].id, null)
}

output "gateway_connection_name" {
  description = "Virtual Network Gateway connection name when created."
  value       = try(azurerm_virtual_network_gateway_connection.this[0].name, null)
}
