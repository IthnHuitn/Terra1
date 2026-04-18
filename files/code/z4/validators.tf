variable "ip_address" {
  type        = string
  description = "ip-адрес"
  
  validation {
    condition     = can(regex("^([0-9]{1,3}\\.){3}[0-9]{1,3}$", var.ip_address))
    error_message = "Некорректный IP-адрес: ${var.ip_address}"
  }
  
  default = "192.168.0.1"
}

variable "ip_addresses" {
  type        = list(string)
  description = "список ip-адресов"
  
  validation {
    condition = alltrue([
      for ip in var.ip_addresses : can(regex("^([0-9]{1,3}\\.){3}[0-9]{1,3}$", ip))
    ])
    error_message = "Список содержит некорректный IP"
  }
  
  default = ["192.168.0.1", "1.1.1.1", "127.0.0.1"]
}
