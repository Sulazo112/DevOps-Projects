output "efs_id" {
  description = "The ID of the EFS file system."
  value       = aws_efs_file_system.this.id
}

output "efs_dns" {
  description = "The DNS name of the EFS file system."
  value       = aws_efs_file_system.this.dns_name
}

