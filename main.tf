# Чтение SSH публичного ключа из файла
data "local_file" "ssh_public_key" {
  filename = pathexpand(var.public_key_path)
}

# Модуль VPC для зоны A (marketing)
module "vpc_marketing" {
  source   = "./vpc"
  env_name = "marketing"
  subnets = [
    { zone = var.marketing_zone, cidr = var.marketing_cidr }
  ]
}

# Модуль VPC для зоны B (analytics)
module "vpc_analytics" {
  source   = "./vpc"
  env_name = "analytics"
  subnets = [
    { zone = var.analytics_zone, cidr = var.analytics_cidr }
  ]
}

# Шаблон cloud-init с передачей SSH-ключа через vars
data "template_file" "cloudinit" {
  template = file("./cloud-init.yml")
  vars = {
    ssh_public_key = trimspace(data.local_file.ssh_public_key.content)
  }
}

# ВМ для проекта marketing
module "marketing-vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = "marketing"
  network_id     = module.vpc_marketing.network_id
  subnet_zones   = [var.marketing_zone]
  subnet_ids     = module.vpc_marketing.subnet_ids_list
  instance_name  = "marketing-web"
  instance_count = 1
  image_family   = "ubuntu-2004-lts"
  public_ip      = true

  providers = {
    yandex = yandex
  }
  labels = {
    project = "marketing"
  }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered
    serial-port-enable = 1
  }
}

# ВМ для проекта analytics
module "analytics-vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = "analytics"
  network_id     = module.vpc_analytics.network_id
  subnet_zones   = [var.analytics_zone]
  subnet_ids     = module.vpc_analytics.subnet_ids_list
  instance_name  = "analytics-web"
  instance_count = 1
  image_family   = "ubuntu-2004-lts"
  public_ip      = true

  providers = {
    yandex = yandex
  }
  labels = {
    project = "analytics"
  }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered
    serial-port-enable = 1
  }
}