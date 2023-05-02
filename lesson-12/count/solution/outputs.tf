output "public_ips" {
  description = "Public IP addresses of each of the Instances"
  value       = aws_instance.count_lab[*].public_ip
}