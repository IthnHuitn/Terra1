# outputs.tf

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

output "security_group_id" {
  value = yandex_vpc_security_group.example.id
  description = "Security Group ID"
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

output "storage_vm_external_ip" {
  value = yandex_compute_instance.storage.network_interface[0].nat_ip_address
  description = "External IP address of storage VM"
}

output "storage_vm_internal_ip" {
  value = yandex_compute_instance.storage.network_interface[0].ip_address
  description = "Internal IP address of storage VM"
}

output "storage_vm_secondary_disks" {
  value = [
    for disk in yandex_compute_instance.storage.secondary_disk :
    disk.disk_id
  ]
  description = "IDs of secondary disks attached to storage VM"
}

output "all_vms_fqdn" {
  value = {
    webservers = {
      for idx, instance in yandex_compute_instance.web :
      instance.name => instance.fqdn
    }
    databases = {
      for name, instance in yandex_compute_instance.db :
      name => instance.fqdn
    }
    storage = {
      storage = yandex_compute_instance.storage.fqdn
    }
  }
  description = "FQDN of all virtual machines"
}

output "ansible_inventory_path" {
  value = local_file.ansible_inventory.filename
  description = "Path to generated Ansible inventory file"
}

output "all_vms_list" {
  description = "List of all VMs with their name, id, and fqdn"
  value = concat(
    # VM из count ресурса (web-1, web-2)
    [
      for instance in yandex_compute_instance.web : {
        name = instance.name
        id   = instance.id
        fqdn = instance.fqdn
      }
    ],
    # VM из for_each ресурса (main, replica)
    [
      for name, instance in yandex_compute_instance.db : {
        name = instance.name
        id   = instance.id
        fqdn = instance.fqdn
      }
    ],
    # VM из отдельного ресурса (storage)
    [
      {
        name = yandex_compute_instance.storage.name
        id   = yandex_compute_instance.storage.id
        fqdn = yandex_compute_instance.storage.fqdn
      }
    ]
  )
}