output "mysql_root_password" {
  description = "MySQL root password"
  value       = random_password.mysql_root_password.result
  sensitive   = true
}

output "mysql_wordpress_password" {
  description = "MySQL wordpress user password"
  value       = random_password.mysql_wordpress_password.result
  sensitive   = true
}

output "connection_command" {
  description = "Command to connect to MySQL"
  value       = "ssh ${var.vm_user}@${var.vm_ip} 'docker exec -it mysql-wordpress mysql -u root -p'"
}