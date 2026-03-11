# EIP(s)
resource "aws_eip" "nat" {
  count      = var.single_nat_gateway ? 1 : length(var.public_subnet_ids)
  domain     = "vpc"
  depends_on = [] # IGW already created in VPC module

  tags = merge(var.tags, {
    Name = "${var.project_name}-nat-eip-${count.index}"
  })
}

# NAT Gateway(s)
resource "aws_nat_gateway" "nat" {
  count         = var.single_nat_gateway ? 1 : length(var.public_subnet_ids)
  allocation_id = aws_eip.nat[count.index].id
  subnet_id     = var.public_subnet_ids[count.index]

  tags = merge(var.tags, {
    Name = "${var.project_name}-nat-${count.index}"
  })
}

# Add default route 0.0.0.0/0 via NAT to each private route table
resource "aws_route" "private_to_nat" {
  for_each = {
    for idx, rt in var.private_route_table_ids :
    idx => rt
  }

  route_table_id         = each.value
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat[0].id
}

