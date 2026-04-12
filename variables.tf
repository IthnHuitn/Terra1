# ============================================
# YANDEX CLOUD VARIABLES
# ============================================

variable "cloud_id" {
  description = "Yandex Cloud ID"
  type        = string
  default     = "b1g********"
}

variable "folder_id" {
  description = "Yandex Cloud Folder ID"
  type        = string
  default     = "b1g********"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "Availability zone"
}

# ============================================
# NETWORK VARIABLES
# ============================================

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network name"
}

variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "Subnet CIDR block"
}

# ============================================
# SSH VARIABLES
# ============================================

variable "ssh_user" {
  type        = string
  default     = "ubuntu"
  description = "SSH username for VMs"
}

variable "vms_ssh_root_key" {
  type        = string
  default     = "~/.ssh/vm5.pub"
  description = "Path to public SSH key"
}

# ============================================
# SERVICE ACCOUNT
# ============================================

variable "sa_key_path" {
  type        = string
  default     = "~/.authorized_key.json"
  description = "Path to service account authorized key JSON"
}

# ============================================
# COMPUTE VARIABLES
# ============================================

variable "platform_id" {
  type        = string
  default     = "standard-v1"
  description = "VM platform ID"
}

variable "core_fraction" {
  type        = number
  default     = 20
  description = "Core fraction (5, 20, 50, 100)"
}

variable "boot_disk_type" {
  type        = string
  default     = "network-hdd"
  description = "Boot disk type"
}

# ============================================
# VM CONFIGURATIONS
# ============================================

variable "web_vm_config" {
  type = object({
    count     = number
    cores     = number
    memory    = number
    disk_size = number
  })
  default = {
    count     = 2
    cores     = 2
    memory    = 2
    disk_size = 10
  }
  description = "Web VMs configuration"
}

variable "db_vm_configs" {
  type = list(object({
    vm_name     = string
    cpu         = number
    ram         = number
    disk_volume = number
  }))
  default = [
    {
      vm_name     = "main"
      cpu         = 2
      ram         = 4
      disk_volume = 20
    },
    {
      vm_name     = "replica"
      cpu         = 2
      ram         = 2
      disk_volume = 15
    }
  ]
  description = "Database VMs configuration"
}

variable "storage_vm_config" {
  type = object({
    cores          = number
    memory         = number
    boot_disk_size = number
    extra_disks = object({
      count = number
      size  = number
      type  = string
    })
  })
  default = {
    cores          = 2
    memory         = 2
    boot_disk_size = 10
    extra_disks = {
      count = 3
      size  = 1
      type  = "network-hdd"
    }
  }
  description = "Storage VM configuration"
}

# ============================================
# SECURITY GROUP VARIABLES
# ============================================

variable "sg_name" {
  type        = string
  default     = "dynamic-sg"
  description = "Security group name"
}

variable "allowed_ingress_ports" {
  type = list(object({
    port        = number
    protocol    = string
    description = string
    cidr_blocks = list(string)
  }))
  default = [
    {
      port        = 22
      protocol    = "TCP"
      description = "SSH access"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      port        = 80
      protocol    = "TCP"
      description = "HTTP access"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      port        = 443
      protocol    = "TCP"
      description = "HTTPS access"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
  description = "Ingress rules configuration"
}

# ============================================
# ANSIBLE VARIABLES
# ============================================

variable "ansible_ssh_args" {
  type        = string
  default     = "-o StrictHostKeyChecking=no"
  description = "Additional SSH arguments for Ansible"
}