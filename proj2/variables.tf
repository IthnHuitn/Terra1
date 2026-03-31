variable "vm_ip" {
  description = "IP address of the remote VM"
  type        = string
}

variable "vm_user" {
  description = "SSH user for the remote VM"
  type        = string
  default     = "ubuntu"
}