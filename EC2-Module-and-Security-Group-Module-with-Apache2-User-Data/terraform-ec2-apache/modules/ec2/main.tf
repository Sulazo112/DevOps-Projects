##########################
# AMI (Amazon Linux 2)
##########################
data "aws_ami" "al2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

##########################
# Default Subnets
##########################
data "aws_subnets" "default" {
  filter {
    name   = "default-for-az"
    values = ["true"]
  }
}

##########################
# EC2 Instance
##########################
resource "aws_instance" "this" {
  ami           = data.aws_ami.al2.id
  instance_type = var.instance_type

  # choose the provided subnet if set; otherwise pick one default subnet deterministically
  subnet_id = var.subnet_id != null ? var.subnet_id : sort(data.aws_subnets.default.ids)[0]

  vpc_security_group_ids      = [var.security_group_id]
  associate_public_ip_address = true
  key_name                    = var.key_name
  user_data                   = var.user_data

  tags = {
    Name = "${var.name_prefix}-ec2"
  }
}

