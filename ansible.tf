# ============================================
# ANSIBLE INVENTORY GENERATION
# ============================================

resource "local_file" "ansible_inventory" {
  content = templatefile("${path.module}/templates/inventory.tpl",
    {
      ansible_user = var.ssh_user
      ssh_args     = var.ansible_ssh_args

      webservers = {
        for idx, instance in yandex_compute_instance.web :
        instance.name => {
          ansible_host = instance.network_interface[0].nat_ip_address
          fqdn         = instance.fqdn
        }
      }

      databases = {
        for name, instance in yandex_compute_instance.db :
        name => {
          ansible_host = instance.network_interface[0].nat_ip_address
          fqdn         = instance.fqdn
        }
      }

      storage = {
        storage = {
          ansible_host = yandex_compute_instance.storage.network_interface[0].nat_ip_address
          fqdn         = yandex_compute_instance.storage.fqdn
        }
      }

      timestamp = timestamp()
    }
  )
  filename = "${path.module}/ansible/inventory.ini"

  depends_on = [
    yandex_compute_instance.web,
    yandex_compute_instance.db,
    yandex_compute_instance.storage
  ]
}