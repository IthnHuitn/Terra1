# Домашнее задание к занятию "`Продвинутые методы работы с Terraform`" - `Ефимов Вячеслав`


### Инструкция по выполнению домашнего задания

   1. Сделайте `fork` данного репозитория к себе в Github и переименуйте его по названию или номеру занятия, например, https://github.com/имя-вашего-репозитория/git-hw или  https://github.com/имя-вашего-репозитория/7-1-ansible-hw).
   2. Выполните клонирование данного репозитория к себе на ПК с помощью команды `git clone`.
   3. Выполните домашнее задание и заполните у себя локально этот файл README.md:
      - впишите вверху название занятия и вашу фамилию и имя
      - в каждом задании добавьте решение в требуемом виде (текст/код/скриншоты/ссылка)
      - для корректного добавления скриншотов воспользуйтесь [инструкцией "Как вставить скриншот в шаблон с решением](https://github.com/netology-code/sys-pattern-homework/blob/main/screen-instruction.md)
      - при оформлении используйте возможности языка разметки md (коротко об этом можно посмотреть в [инструкции  по MarkDown](https://github.com/netology-code/sys-pattern-homework/blob/main/md-instruction.md))
   4. После завершения работы над домашним заданием сделайте коммит (`git commit -m "comment"`) и отправьте его на Github (`git push origin`);
   5. Для проверки домашнего задания преподавателем в личном кабинете прикрепите и отправьте ссылку на решение в виде md-файла в вашем Github.
   6. Любые вопросы по выполнению заданий спрашивайте в чате учебной группы и/или в разделе “Вопросы по заданию” в личном кабинете.
   
Желаем успехов в выполнении домашнего задания!
   
### Дополнительные материалы, которые могут быть полезны для выполнения задания

1. [Руководство по оформлению Markdown файлов](https://gist.github.com/Jekins/2bf2d0638163f1294637#Code)

---

### Задание 1

![terra1-1](https://github.com/IthnHuitn/Terra1/blob/terraform-04/files/screens/terra1-1.png)
![terra1-2](https://github.com/IthnHuitn/Terra1/blob/terraform-04/files/screens/terra1-2.png)
![terra1-3](https://github.com/IthnHuitn/Terra1/blob/terraform-04/files/screens/terra1-3.png)
![terra1-4](https://github.com/IthnHuitn/Terra1/blob/terraform-04/files/screens/terra1-4.png)
[code1](https://github.com/IthnHuitn/Terra1/tree/terraform-04/files/z1/)


---

### Задание 2

![terra2-1](https://github.com/IthnHuitn/Terra1/blob/terraform-04/files/screens/terra2-1.png)
![terra2-2](https://github.com/IthnHuitn/Terra1/blob/terraform-04/files/screens/terra2-2.png)
[code2](https://github.com/IthnHuitn/Terra1/tree/terraform-04/files/z2/)

#### README.md
```markdown
<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [yandex_vpc_network.network](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_network) | resource |
| [yandex_vpc_subnet.subnet](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_subnet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cidr"></a> [cidr](#input\_cidr) | CIDR block for subnet | `string` | n/a | yes |
| <a name="input_env_name"></a> [env\_name](#input\_env\_name) | Environment name for VPC network | `string` | n/a | yes |
| <a name="input_zone"></a> [zone](#input\_zone) | Yandex Cloud availability zone | `string` | `"ru-central1-a"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_network_id"></a> [network\_id](#output\_network\_id) | ID of created VPC network |
| <a name="output_subnet_cidr"></a> [subnet\_cidr](#output\_subnet\_cidr) | CIDR block of created subnet |
| <a name="output_subnet_id"></a> [subnet\_id](#output\_subnet\_id) | ID of created subnet |
| <a name="output_subnet_zone"></a> [subnet\_zone](#output\_subnet\_zone) | Zone of created subnet |
<!-- END_TF_DOCS -->
```
---

### Задание 3

![terra3-1](https://github.com/IthnHuitn/Terra1/blob/terraform-04/files/screens/terra3-1.png)
![terra3-2](https://github.com/IthnHuitn/Terra1/blob/terraform-04/files/screens/terra3-2.png)
![terra3-3](https://github.com/IthnHuitn/Terra1/blob/terraform-04/files/screens/terra3-3.png)
![terra3-4](https://github.com/IthnHuitn/Terra1/blob/terraform-04/files/screens/terra3-4.png)
![terra3-5](https://github.com/IthnHuitn/Terra1/blob/terraform-04/files/screens/terra3-5.png)


---

### Задание 4

![terra4-1](https://github.com/IthnHuitn/Terra1/blob/terraform-04/files/screens/terra4-1.png)
![terra4-2](https://github.com/IthnHuitn/Terra1/blob/terraform-04/files/screens/terra4-2.png)
[code4](https://github.com/IthnHuitn/Terra1/tree/terraform-04/files/z4/)

```shell
Terraform will perform the following actions:

  # module.analytics-vm.yandex_compute_instance.vm[0] will be created
  + resource "yandex_compute_instance" "vm" {
      + allow_stopping_for_update = true
      + created_at                = (known after apply)
      + description               = "TODO: description; {{terraform yyy managed}}"
      + folder_id                 = (known after apply)
      + fqdn                      = (known after apply)
      + gpu_cluster_id            = (known after apply)
      + hardware_generation       = (known after apply)
      + hostname                  = "analytics-analytics-web-0"
      + id                        = (known after apply)
      + labels                    = {
          + "project" = "analytics"
        }
      + maintenance_grace_period  = (known after apply)
      + maintenance_policy        = (known after apply)
      + metadata                  = {
          + "serial-port-enable" = "1"
          + "user-data"          = <<-EOT
                #cloud-config
                users:
                  - name: ubuntu
                    groups: sudo
                    shell: /bin/bash
                    sudo: ["ALL=(ALL) NOPASSWD:ALL"]
                    ssh_authorized_keys:
                      - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDEZNnbfrn7DyGYp0QdzeW7vaAC0H5OZMLKe1a2V//KYyqRoHaA92nHvx2rwDf4rJQZ2H0VzpYK6eVP4IhatXYu0p3W42lFkX9ESWOGdGWGNvSSaFx59qB2BKoe4y1Kpuwmc9ZTU3opwymXi0K8BCej7vsSRMFJy9QspETk3DaMLDZBf5x5rhKuFXyhBVzTsunjMEwA1/HkYYXM4ndJXY4G7T6We+afYR4NAb4zyjagTLGG1XAkORrJTvhfnZ99nBuygYwMxrab/SD36TuVO1CGn09Kmio8EeNB3v3uK+AboLQgE8XF79SB9JNyBe4oE5Wtraek8MvJoHBWxn+eglg9
                package_update: true
                package_upgrade: false
                packages:
                  - vim
                  - nginx
                runcmd:
                  - systemctl enable nginx
                  - systemctl start nginx
            EOT
        }
      + name                      = "analytics-analytics-web-0"
      + network_acceleration_type = "standard"
      + platform_id               = "standard-v1"
      + status                    = (known after apply)
      + zone                      = "ru-central1-b"

      + boot_disk {
          + auto_delete = true
          + device_name = (known after apply)
          + disk_id     = (known after apply)
          + mode        = (known after apply)

          + initialize_params {
              + block_size  = (known after apply)
              + description = (known after apply)
              + image_id    = "fd8k3nqnfpvt19meo2b4"
              + name        = (known after apply)
              + size        = 10
              + snapshot_id = (known after apply)
              + type        = "network-hdd"
            }
        }

      + metadata_options (known after apply)

      + network_interface {
          + index          = (known after apply)
          + ip_address     = (known after apply)
          + ipv4           = true
          + ipv6           = (known after apply)
          + ipv6_address   = (known after apply)
          + mac_address    = (known after apply)
          + nat            = true
          + nat_ip_address = (known after apply)
          + nat_ip_version = (known after apply)
          + subnet_id      = (known after apply)
        }

      + placement_policy (known after apply)

      + resources {
          + core_fraction = 5
          + cores         = 2
          + memory        = 1
        }

      + scheduling_policy {
          + preemptible = true
        }
    }

  # module.marketing-vm.yandex_compute_instance.vm[0] will be created
  + resource "yandex_compute_instance" "vm" {
      + allow_stopping_for_update = true
      + created_at                = (known after apply)
      + description               = "TODO: description; {{terraform yyy managed}}"
      + folder_id                 = (known after apply)
      + fqdn                      = (known after apply)
      + gpu_cluster_id            = (known after apply)
      + hardware_generation       = (known after apply)
      + hostname                  = "marketing-marketing-web-0"
      + id                        = (known after apply)
      + labels                    = {
          + "project" = "marketing"
        }
      + maintenance_grace_period  = (known after apply)
      + maintenance_policy        = (known after apply)
      + metadata                  = {
          + "serial-port-enable" = "1"
          + "user-data"          = <<-EOT
                #cloud-config
                users:
                  - name: ubuntu
                    groups: sudo
                    shell: /bin/bash
                    sudo: ["ALL=(ALL) NOPASSWD:ALL"]
                    ssh_authorized_keys:
                      - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDEZNnbfrn7DyGYp0QdzeW7vaAC0H5OZMLKe1a2V//KYyqRoHaA92nHvx2rwDf4rJQZ2H0VzpYK6eVP4IhatXYu0p3W42lFkX9ESWOGdGWGNvSSaFx59qB2BKoe4y1Kpuwmc9ZTU3opwymXi0K8BCej7vsSRMFJy9QspETk3DaMLDZBf5x5rhKuFXyhBVzTsunjMEwA1/HkYYXM4ndJXY4G7T6We+afYR4NAb4zyjagTLGG1XAkORrJTvhfnZ99nBuygYwMxrab/SD36TuVO1CGn09Kmio8EeNB3v3uK+AboLQgE8XF79SB9JNyBe4oE5Wtraek8MvJoHBWxn+eglg9
                package_update: true
                package_upgrade: false
                packages:
                  - vim
                  - nginx
                runcmd:
                  - systemctl enable nginx
                  - systemctl start nginx
            EOT
        }
      + name                      = "marketing-marketing-web-0"
      + network_acceleration_type = "standard"
      + platform_id               = "standard-v1"
      + status                    = (known after apply)
      + zone                      = "ru-central1-a"

      + boot_disk {
          + auto_delete = true
          + device_name = (known after apply)
          + disk_id     = (known after apply)
          + mode        = (known after apply)

          + initialize_params {
              + block_size  = (known after apply)
              + description = (known after apply)
              + image_id    = "fd8k3nqnfpvt19meo2b4"
              + name        = (known after apply)
              + size        = 10
              + snapshot_id = (known after apply)
              + type        = "network-hdd"
            }
        }

      + metadata_options (known after apply)

      + network_interface {
          + index          = (known after apply)
          + ip_address     = (known after apply)
          + ipv4           = true
          + ipv6           = (known after apply)
          + ipv6_address   = (known after apply)
          + mac_address    = (known after apply)
          + nat            = true
          + nat_ip_address = (known after apply)
          + nat_ip_version = (known after apply)
          + subnet_id      = (known after apply)
        }

      + placement_policy (known after apply)

      + resources {
          + core_fraction = 5
          + cores         = 2
          + memory        = 1
        }

      + scheduling_policy {
          + preemptible = true
        }
    }

  # module.vpc_analytics.yandex_vpc_network.network will be created
  + resource "yandex_vpc_network" "network" {
      + created_at                = (known after apply)
      + default_security_group_id = (known after apply)
      + folder_id                 = (known after apply)
      + id                        = (known after apply)
      + labels                    = (known after apply)
      + name                      = "analytics"
      + subnet_ids                = (known after apply)
    }

  # module.vpc_analytics.yandex_vpc_subnet.subnet["analytics-ru-central1-b"] will be created
  + resource "yandex_vpc_subnet" "subnet" {
      + created_at     = (known after apply)
      + folder_id      = (known after apply)
      + id             = (known after apply)
      + labels         = (known after apply)
      + name           = "analytics-ru-central1-b"
      + network_id     = (known after apply)
      + v4_cidr_blocks = [
          + "10.0.2.0/24",
        ]
      + v6_cidr_blocks = (known after apply)
      + zone           = "ru-central1-b"
    }

  # module.vpc_marketing.yandex_vpc_network.network will be created
  + resource "yandex_vpc_network" "network" {
      + created_at                = (known after apply)
      + default_security_group_id = (known after apply)
      + folder_id                 = (known after apply)
      + id                        = (known after apply)
      + labels                    = (known after apply)
      + name                      = "marketing"
      + subnet_ids                = (known after apply)
    }

  # module.vpc_marketing.yandex_vpc_subnet.subnet["marketing-ru-central1-a"] will be created
  + resource "yandex_vpc_subnet" "subnet" {
      + created_at     = (known after apply)
      + folder_id      = (known after apply)
      + id             = (known after apply)
      + labels         = (known after apply)
      + name           = "marketing-ru-central1-a"
      + network_id     = (known after apply)
      + v4_cidr_blocks = [
          + "10.0.1.0/24",
        ]
      + v6_cidr_blocks = (known after apply)
      + zone           = "ru-central1-a"
    }

Plan: 6 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + analytics_vm_internal_ip = (known after apply)
  + analytics_vm_ip          = (known after apply)
  + marketing_vm_internal_ip = (known after apply)
  + marketing_vm_ip          = (known after apply)
  + out                      = [
      + (known after apply),
      + (known after apply),
    ]
  + vpc_analytics_info       = {
      + network_id = (known after apply)
      + subnets    = {
          + ru-central1-b = {
              + cidr       = "10.0.2.0/24"
              + id         = (known after apply)
              + name       = "analytics-ru-central1-b"
              + network_id = (known after apply)
              + zone       = "ru-central1-b"
            }
        }
    }
  + vpc_marketing_info       = {
      + network_id = (known after apply)
      + subnets    = {
          + ru-central1-a = {
              + cidr       = "10.0.1.0/24"
              + id         = (known after apply)
              + name       = "marketing-ru-central1-a"
              + network_id = (known after apply)
              + zone       = "ru-central1-a"
            }
        }
    }
╷
```
---

### Задание 5
