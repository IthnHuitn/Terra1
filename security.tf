# ============================================
# SECURITY GROUP
# ============================================

resource "yandex_vpc_security_group" "example" {
  name       = var.sg_name
  network_id = yandex_vpc_network.develop.id
  folder_id  = var.folder_id

  # Динамическое создание ingress правил
  dynamic "ingress" {
    for_each = var.allowed_ingress_ports
    content {
      protocol       = ingress.value.protocol
      description    = ingress.value.description
      port           = ingress.value.port
      v4_cidr_blocks = ingress.value.cidr_blocks
    }
  }

  # Единое egress правило (разрешаем всё)
  egress {
    protocol       = "ANY"
    description    = "Allow all outgoing traffic"
    v4_cidr_blocks = ["0.0.0.0/0"]
    from_port      = 0
    to_port        = 65535
  }
}