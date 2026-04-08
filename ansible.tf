# ansible.tf - создание динамического inventory файла для Ansible

# Создаем inventory файл используя шаблон
resource "local_file" "ansible_inventory" {
  content = templatefile("${path.module}/templates/inventory.tpl",
    {
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
    }
  )
  filename = "${path.module}/ansible/inventory.ini"
}