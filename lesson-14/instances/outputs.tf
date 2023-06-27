## Also want private IPs so I can test if one can ping to the other internally...

output "public_dns_server_1" {
  description = "DNS name of the First EC2 instance"
  value       = aws_instance.web_server_1.public_dns
}

output "public_ip_server_1" {
  description = "Public IP address of the First EC2 instance"
  value       = aws_instance.web_server_1.public_ip
}

output "private_ip_server_1" {
  description = "Private IP address of the First EC2 instance"
  value       = aws_instance.web_server_1.private_ip
}

output "web_server_1_id" {
  description = "ID of the First EC2 instance"
  value       = aws_instance.web_server_1.tags.ID
}

output "public_dns_server_2" {
  description = "DNS name of the Second EC2 instance"
  value       = aws_instance.web_server_2.public_dns
}

output "public_ip_server_2" {
  description = "Public IP address of the Second EC2 instance"
  value       = aws_instance.web_server_2.public_ip
}

output "private_ip_server_2" {
  description = "Private IP address of the Second EC2 instance"
  value       = aws_instance.web_server_2.private_ip
}

output "web_server_2_id" {
  description = "ID of the Second EC2 instance"
  value       = aws_instance.web_server_2.tags.ID
}