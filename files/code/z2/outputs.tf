output "marketing_vm_ip" {
  description = "External IP address of marketing VM"
  value       = module.marketing-vm.external_ip_address[0]
}

output "analytics_vm_ip" {
  description = "External IP address of analytics VM"
  value       = module.analytics-vm.external_ip_address[0]
}

output "marketing_vm_internal_ip" {
  description = "Internal IP address of marketing VM"
  value       = module.marketing-vm.internal_ip_address[0]
}

output "analytics_vm_internal_ip" {
  description = "Internal IP address of analytics VM"
  value       = module.analytics-vm.internal_ip_address[0]
}

output "vpc_marketing_info" {
  description = "Marketing VPC information"
  value = {
    network_id  = module.vpc_marketing.network_id
    subnet_id   = module.vpc_marketing.subnet_id
    subnet_zone = module.vpc_marketing.subnet_zone
    subnet_cidr = module.vpc_marketing.subnet_cidr
  }
}

output "vpc_analytics_info" {
  description = "Analytics VPC information"
  value = {
    network_id  = module.vpc_analytics.network_id
    subnet_id   = module.vpc_analytics.subnet_id
    subnet_zone = module.vpc_analytics.subnet_zone
    subnet_cidr = module.vpc_analytics.subnet_cidr
  }
}