variable "env_name" {
  description = "Environment name for VPC network"
  type        = string
}

variable "subnets" {
  description = "List of subnets to create"
  type = list(object({
    zone = string
    cidr = string
  }))
  
  validation {
    condition     = length(var.subnets) > 0
    error_message = "At least one subnet must be specified."
  }
  
  validation {
    condition = alltrue([
      for s in var.subnets : can(regex("^ru-central1-[a-c]$", s.zone))
    ])
    error_message = "Zone must be one of: ru-central1-a, ru-central1-b, ru-central1-c."
  }
  
  validation {
    condition = alltrue([
      for s in var.subnets : can(cidrhost(s.cidr, 0))
    ])
    error_message = "All CIDR blocks must be valid IPv4 CIDR notation."
  }
}