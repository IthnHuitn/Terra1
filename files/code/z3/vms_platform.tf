### VM web platform variables

variable "vm_web_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "VM name for web platform"
}

variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v4a"
  description = "Platform ID for web VM"
}

variable "vm_web_cores" {
  type        = number
  default     = 2
  description = "Number of CPU cores for web VM"
}

variable "vm_web_memory" {
  type        = number
  default     = 1
  description = "Memory in GB for web VM"
}

variable "vm_web_core_fraction" {
  type        = number
  default     = 50
  description = "Core fraction for web VM (5, 20, 50, 100)"
}

variable "vm_web_preemptible" {
  type        = bool
  default     = true
  description = "Is preemptible VM"
}

variable "vm_web_nat_enabled" {
  type        = bool
  default     = true
  description = "Enable NAT for web VM"
}

variable "vm_web_image_family" {
  type        = string
  default     = "ubuntu-2004-lts-oslogin"
  description = "Image family for web VM"
}

variable "vm_web_serial_port_enable" {
  type        = number
  default     = 1
  description = "Enable serial port"
}

### VM db platform variables

variable "vm_db_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "VM name for db platform"
}

variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v4a"
  description = "Platform ID for db VM"
}

variable "vm_db_cores" {
  type        = number
  default     = 2
  description = "Number of CPU cores for db VM"
}

variable "vm_db_memory" {
  type        = number
  default     = 2
  description = "Memory in GB for db VM"
}

variable "vm_db_core_fraction" {
  type        = number
  default     = 20
  description = "Core fraction for db VM (5, 20, 50, 100)"
}

variable "vm_db_preemptible" {
  type        = bool
  default     = true
  description = "Is preemptible VM"
}

variable "vm_db_nat_enabled" {
  type        = bool
  default     = true
  description = "Enable NAT for db VM"
}

variable "vm_db_image_family" {
  type        = string
  default     = "ubuntu-2004-lts-oslogin"
  description = "Image family for db VM"
}

variable "vm_db_serial_port_enable" {
  type        = number
  default     = 1
  description = "Enable serial port"
}

variable "vm_db_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "Availability zone for db VM"
}