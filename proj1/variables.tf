# Cloud provider credentials
variable "cloud_id" {
  description = "Yandex Cloud ID"
  type        = string
}

variable "folder_id" {
  description = "Yandex Cloud Folder ID"
  type        = string
}

variable "token" {
  description = "Yandex Cloud OAuth token"
  type        = string
  sensitive   = true
}

# VM configuration
variable "vm_name" {
  description = "Name of the virtual machine"
  type        = string
  default     = "terraform-vm"
}

variable "vm_platform_id" {
  description = "Platform ID for VM"
  type        = string
  default     = "standard-v2"
}

variable "vm_cores" {
  description = "Number of CPU cores"
  type        = number
  default     = 2
}

variable "vm_memory" {
  description = "Memory in GB"
  type        = number
  default     = 2
}

variable "vm_core_fraction" {
  description = "Core fraction (5-100)"
  type        = number
  default     = 20
}

variable "vm_preemptible" {
  description = "Use preemptible VM (cheaper but can be terminated)"
  type        = bool
  default     = true
}

# SSH access
variable "ssh_public_key_path" {
  description = "Path to SSH public key"
  type        = string
  default     = "~/.ssh/vm5.pub"
}

# Network
variable "subnet_id" {
  description = "Subnet ID for the VM"
  type        = string
}