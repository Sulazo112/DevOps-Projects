# ------------------------ VPC ------------------------
resource "aws_vpc" "this" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = merge(
    var.tags,
    { Name = "${var.project_name}-vpc" }
  )
}

# ------------------------ Internet Gateway ------------------------
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.this.id

  tags = merge(
    var.tags,
    { Name = "${var.project_name}-igw" }
  )
}

# ------------------------ Public Subnets ------------------------
resource "aws_subnet" "public" {
  for_each = {
    for i, cidr in var.public_subnet_cidrs :
    i => { cidr = cidr, az = var.azs[i] }
  }

  vpc_id                  = aws_vpc.this.id
  cidr_block              = each.value.cidr
  availability_zone       = each.value.az
  map_public_ip_on_launch = true

  tags = merge(
    var.tags,
    { Name = "${var.project_name}-public-${each.value.az}" }
  )
}

# ------------------------ Private App Subnets ------------------------
resource "aws_subnet" "private_app" {
  for_each = {
    for i, cidr in var.private_app_subnet_cidrs :
    i => { cidr = cidr, az = var.azs[i] }
  }

  vpc_id            = aws_vpc.this.id
  cidr_block        = each.value.cidr
  availability_zone = each.value.az

  tags = merge(
    var.tags,
    { Name = "${var.project_name}-private-app-${each.value.az}" }
  )
}

# ------------------------ Private DB Subnets ------------------------
resource "aws_subnet" "private_db" {
  for_each = {
    for i, cidr in var.private_db_subnet_cidrs :
    i => { cidr = cidr, az = var.azs[i] }
  }

  vpc_id            = aws_vpc.this.id
  cidr_block        = each.value.cidr
  availability_zone = each.value.az

  tags = merge(
    var.tags,
    { Name = "${var.project_name}-private-db-${each.value.az}" }
  )
}

# ------------------------ Public Route Table ------------------------
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  tags = merge(
    var.tags,
    { Name = "${var.project_name}-rtb-public" }
  )
}

resource "aws_route" "public_inet" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "public_assoc" {
  for_each = aws_subnet.public

  subnet_id      = each.value.id
  route_table_id = aws_route_table.public.id
}

# ------------------------ Private App Route Tables ------------------------
resource "aws_route_table" "private_app" {
  for_each = aws_subnet.private_app

  vpc_id = aws_vpc.this.id

  tags = merge(
    var.tags,
    { Name = "${var.project_name}-rtb-private-app-${each.value.availability_zone}" }
  )
}

resource "aws_route_table_association" "private_app_assoc" {
  for_each = aws_subnet.private_app

  subnet_id      = each.value.id
  route_table_id = aws_route_table.private_app[each.key].id
}

# Private DB subnet group is handled in the RDS module.

