# Output для web ВМ
output "web_vm_info" {
  description = "Information about web VM"
  value = {
    instance_name = yandex_compute_instance.platform.name
    external_ip   = yandex_compute_instance.platform.network_interface[0].nat_ip_address
    fqdn          = yandex_compute_instance.platform.fqdn
  }
}

# Output для db ВМ
output "db_vm_info" {
  description = "Information about database VM"
  value = {
    instance_name = yandex_compute_instance.platform_db.name
    external_ip   = yandex_compute_instance.platform_db.network_interface[0].nat_ip_address
    fqdn          = yandex_compute_instance.platform_db.fqdn
  }
}


