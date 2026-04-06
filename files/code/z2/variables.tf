###cloud vars

variable "cloud_id" {
  type        = string
  default     = "b1gj4je3597r8t17tg2c"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  default     = "b1gtustslt38qdmba893"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}

###ssh vars

variable "vms_ssh_root_key" {
  type        = string
  default     = "~/.ssh/vm5.pub"
  description = "Path to public SSH key"
}

###web vm vars

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
  description = "Core fraction for web VM (20, 50, 100)"
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
