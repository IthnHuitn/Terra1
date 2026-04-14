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
    network_id = module.vpc_marketing.network_id
    subnets    = module.vpc_marketing.subnets_info
  }
}

output "vpc_analytics_info" {
  description = "Analytics VPC information"
  value = {
    network_id = module.vpc_analytics.network_id
    subnets    = module.vpc_analytics.subnets_info
  }
}