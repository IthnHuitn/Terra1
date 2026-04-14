output "network_id" {
  description = "ID of created VPC network"
  value       = yandex_vpc_network.network.id
}

output "subnet_id" {
  description = "ID of created subnet"
  value       = yandex_vpc_subnet.subnet.id
}

output "subnet_zone" {
  description = "Zone of created subnet"
  value       = yandex_vpc_subnet.subnet.zone
}

output "subnet_cidr" {
  description = "CIDR block of created subnet"
  value       = yandex_vpc_subnet.subnet.v4_cidr_blocks[0]
}