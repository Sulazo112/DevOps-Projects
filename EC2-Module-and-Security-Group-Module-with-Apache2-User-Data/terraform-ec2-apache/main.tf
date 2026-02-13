locals {
  name = var.project_name
}

# Security Group Module
module "security_group" {
  source        = "./modules/security_group"
  name_prefix   = local.name
  vpc_id        = var.vpc_id
  allowed_ssh   = var.allowed_ssh_cidr
}

# EC2 Module
module "ec2_instance" {
  source            = "./modules/ec2"
  name_prefix       = local.name
  instance_type     = var.instance_type
  key_name          = var.key_name
  subnet_id         = var.public_subnet_id
  security_group_id = module.security_group.security_group_id

  # UserData script
  user_data = file("${path.module}/apache_userdata.sh")
}

