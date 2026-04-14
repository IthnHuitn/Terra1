variable "env_name" {
  description = "Environment name for VPC network"
  type        = string
}

variable "zone" {
  description = "Yandex Cloud availability zone"
  type        = string
  default     = "ru-central1-a"
}

variable "cidr" {
  description = "CIDR block for subnet"
  type        = string
}