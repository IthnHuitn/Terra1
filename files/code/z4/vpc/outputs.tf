output "network_id" {
  description = "ID of created VPC network"
  value       = yandex_vpc_network.network.id
}

output "subnet_ids" {
  description = "Map of subnet IDs by zone"
  value = {
    for key, subnet in yandex_vpc_subnet.subnet :
    subnet.zone => subnet.id
  }
}

output "subnet_ids_list" {
  description = "List of all subnet IDs"
  value       = [for subnet in yandex_vpc_subnet.subnet : subnet.id]
}

output "subnets_info" {
  description = "Detailed information about all subnets"
  value = {
    for key, subnet in yandex_vpc_subnet.subnet :
    subnet.zone => {
      id         = subnet.id
      name       = subnet.name
      zone       = subnet.zone
      cidr       = subnet.v4_cidr_blocks[0]
      network_id = subnet.network_id
    }
  }
}

output "subnet_zones" {
  description = "List of zones where subnets are created"
  value       = [for subnet in yandex_vpc_subnet.subnet : subnet.zone]
}