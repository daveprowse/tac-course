output "public_dns_a" {
  description = "DNS name of the EC2 instance"
  value       = aws_instance.lab_10-a.public_dns
}

output "public_ip_a" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.lab_10-a.public_ip
}

output "public_dns_b" {
  description = "DNS name of the EC2 instance"
  value       = aws_instance.lab_10-b.public_dns
}

output "public_ip_b" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.lab_10-b.public_ip
}
