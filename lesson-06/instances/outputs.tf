output "public_dns" {
  description = "DNS name of the EC2 instance"
  value       = aws_instance.lesson_06.public_dns
}

output "public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.lesson_06.public_ip
}
