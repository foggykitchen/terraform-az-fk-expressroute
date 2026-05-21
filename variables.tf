variable "name" {
  description = "Name of the ExpressRoute circuit."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group where the ExpressRoute circuit will be created."
  type        = string
}

variable "location" {
  description = "Azure region for the ExpressRoute circuit."
  type        = string
}

variable "service_provider_name" {
  description = "ExpressRoute service provider name."
  type        = string
  default     = "Oracle Cloud FastConnect"
}

variable "peering_location" {
  description = "Peering location for the ExpressRoute circuit."
  type        = string
}

variable "bandwidth_in_mbps" {
  description = "Provisioned circuit bandwidth in Mbps."
  type        = number
}

variable "sku" {
  description = "ExpressRoute SKU definition."
  type = object({
    tier   = optional(string, "Standard")
    family = optional(string, "MeteredData")
  })
  default = {}
}

variable "allow_classic_operations" {
  description = "Whether classic operations are allowed on the circuit."
  type        = bool
  default     = false
}

variable "gateway_connection" {
  description = "Optional Virtual Network Gateway connection created only when enabled."
  type = object({
    enabled                      = optional(bool, false)
    name                         = string
    virtual_network_gateway_id   = string
    authorization_key            = optional(string)
    routing_weight               = optional(number)
    express_route_gateway_bypass = optional(bool, false)
  })
  default = null
}

variable "tags" {
  description = "Resource tags applied to the circuit."
  type        = map(string)
  default     = {}
}
