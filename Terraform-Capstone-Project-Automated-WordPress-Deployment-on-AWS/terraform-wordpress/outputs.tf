output "alb_dns_name" {
  description = "Public DNS name of the Application Load Balancer."
  value       = module.alb.alb_dns_name
}

output "rds_endpoint" {
  description = "Connection endpoint for the RDS database instance."
  value       = module.rds.rds_endpoint
}

output "efs_id" {
  description = "ID of the EFS filesystem used for shared storage."
  value       = module.efs.efs_id
}

