### cloud vars

variable "cloud_id" {
  description = "Yandex Cloud ID"
  type        = string
  sensitive   = true
}

variable "folder_id" {
  description = "Yandex Cloud Folder ID"
  type        = string
  sensitive   = true
}

variable "service_account_key_file" {
  description = "Path to service account authorized key file"
  type        = string
  default     = "~/.authorized_key.json"
}

variable "public_key_path" {
  description = "Path to SSH public key file"
  type        = string
  default     = "/home/evilmc/.ssh/vm5.pub"
}

variable "default_zone" {
  description = "Default Yandex Cloud zone"
  type        = string
  default     = "ru-central1-a"
}

variable "marketing_zone" {
  description = "Zone for marketing project"
  type        = string
  default     = "ru-central1-a"
}

variable "analytics_zone" {
  description = "Zone for analytics project"
  type        = string
  default     = "ru-central1-b"
}

variable "marketing_cidr" {
  description = "CIDR block for marketing VPC"
  type        = string
  default     = "10.0.1.0/24"
}

variable "analytics_cidr" {
  description = "CIDR block for analytics VPC"
  type        = string
  default     = "10.0.2.0/24"
}