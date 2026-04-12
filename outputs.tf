# ============================================
# OUTPUTS
# ============================================

output "ubuntu_image_id" {
  value       = data.yandex_compute_image.ubuntu.id
  description = "Ubuntu 22.04 LTS image ID used"
}

output "web_instances_external_ips" {
  value = {
    for idx, instance in yandex_compute_instance.web :
    "web-${idx + 1}" => instance.network_interface[0].nat_ip_address
  }
  description = "External IP addresses of web instances"
}

output "db_instances_external_ips" {
  value = {
    for name, instance in yandex_compute_instance.db :
    name => instance.network_interface[0].nat_ip_address
  }
  description = "External IP addresses of database instances"
}

output "storage_vm_external_ip" {
  value       = yandex_compute_instance.storage.network_interface[0].nat_ip_address
  description = "External IP address of storage VM"
}

output "storage_disks_info" {
  value = {
    for idx, disk in yandex_compute_disk.storage_disk :
    disk.name => {
      id   = disk.id
      size = disk.size
      type = disk.type
    }
  }
  description = "Information about created storage disks"
}

output "ansible_inventory_path" {
  value       = local_file.ansible_inventory.filename
  description = "Path to generated Ansible inventory file"
}

output "ssh_connection_strings" {
  value = {
    webservers = {
      for idx, instance in yandex_compute_instance.web :
      instance.name => "ssh ${var.ssh_user}@${instance.network_interface[0].nat_ip_address}"
    }
    databases = {
      for name, instance in yandex_compute_instance.db :
      name => "ssh ${var.ssh_user}@${instance.network_interface[0].nat_ip_address}"
    }
    storage = {
      storage = "ssh ${var.ssh_user}@${yandex_compute_instance.storage.network_interface[0].nat_ip_address}"
    }
  }
  description = "SSH connection strings for all VMs"
}