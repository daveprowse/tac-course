output "ebs_block_device" {
  description = "block device volume IDs"
  value       = aws_instance.splat_lab.ebs_block_device[*].volume_id
}