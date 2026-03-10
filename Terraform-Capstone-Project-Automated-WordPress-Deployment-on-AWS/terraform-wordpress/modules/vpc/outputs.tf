output "vpc_id" {
  value = aws_vpc.this.id
}

output "public_subnet_ids" {
  value = [for s in aws_subnet.public : s.id]
}

output "private_app_subnet_ids" {
  value = [for s in aws_subnet.private_app : s.id]
}

output "private_db_subnet_ids" {
  value = [for s in aws_subnet.private_db : s.id]
}

output "public_route_table_ids" {
  value = [aws_route_table.public.id]
}

output "private_app_route_table_ids" {
  value = [for _, r in aws_route_table.private_app : r.id]
}

