data "aws_vpc" "selected" {
  # If vpc_id is null, pick the default VPC
  default = var.vpc_id == null ? true : false
}

# If vpc_id is provided, use it instead of default
data "aws_vpc" "by_id" {
  count = var.vpc_id == null ? 0 : 1
  id    = var.vpc_id
}

locals {
  vpc_id_effective = var.vpc_id == null ? data.aws_vpc.selected.id : data.aws_vpc.by_id[0].id
}

resource "aws_security_group" "this" {
  name        = "${var.name_prefix}-sg"
  description = "Security group for Apache EC2"
  vpc_id      = local.vpc_id_effective

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.allowed_ssh]
  }

  egress {
    description = "Allow all egress"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

