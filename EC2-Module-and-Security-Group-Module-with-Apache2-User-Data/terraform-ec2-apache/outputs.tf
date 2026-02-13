output "ec2_public_ip" {
  value       = module.ec2_instance.public_ip
  description = "Public IP of the EC2 instance"
}

output "ec2_public_dns" {
  value       = module.ec2_instance.public_dns
  description = "Public DNS of the EC2 instance"
}

output "security_group_id" {
  value       = module.security_group.security_group_id
  description = "The created security group ID"
}

