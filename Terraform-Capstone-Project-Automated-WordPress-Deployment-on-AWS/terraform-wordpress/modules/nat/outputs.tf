output "nat_gateway_ids" {
  description = "List of NAT Gateway IDs created (one or many depending on single_nat_gateway)."
  value       = [for ngw in aws_nat_gateway.nat : ngw.id]
}

output "nat_gateway_public_ips" {
  description = "Public Elastic IP addresses associated with the NAT Gateway(s)."
  value       = [for eip in aws_eip.nat : eip.public_ip]
}

output "nat_gateway_allocation_ids" {
  description = "Allocation IDs of EIPs used by the NAT Gateway(s)."
  value       = [for eip in aws_eip.nat : eip.id]
}

output "private_nat_route_ids" {
  description = "Map of private route table ID to the created default route (0.0.0.0/0) via NAT."
  value       = { for rt_id, route in aws_route.private_to_nat : rt_id => route.id }
}

output "single_nat_gateway" {
  description = "Whether deployment used a single NAT Gateway (true) or per-AZ NAT (false)."
  value       = var.single_nat_gateway
}

