locals {
  Project = var.project_name
  Owner   = "DigitalBoost"
  Stack   = "WordPress"
}

# ------------------------ VPC ------------------------
module "vpc" {
  source                   = "./modules/vpc"
  project_name             = var.project_name
  vpc_cidr                 = var.vpc_cidr
  azs                      = var.azs
  public_subnet_cidrs      = var.public_subnet_cidrs
  private_app_subnet_cidrs = var.private_app_subnet_cidrs
  private_db_subnet_cidrs  = var.private_db_subnet_cidrs
  tags                     = local.tags
}

# ------------------------ NAT & IGW ------------------------
module "nat" {
  source                   = "./modules/nat"
  project_name             = var.project_name
  vpc_id                   = module.vpc.vpc_id
  public_route_table_ids   = module.vpc.public_route_table_ids
  private_route_table_ids  = module.vpc.private_app_route_table_ids
  public_subnet_ids        = module.vpc.public_subnet_ids
  single_nat_gateway       = true
  tags                     = local.tags
}

# ------------------------ RDS Credentials (via SSM) ------------------------
resource "random_password" "db_password" {
  length  = 20
  special = true
}

resource "aws_ssm_parameter" "db_password" {
  name  = "/${var.project_name}/db_password"
  type  = "SecureString"
  value = random_password.db_password.result
  tags  = local.tags
}

# ------------------------ Security Groups ------------------------
resource "aws_security_group" "alb_sg" {
  name        = "${var.project_name}-alb-sg"
  description = "ALB SG"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = local.tags
}

resource "aws_security_group" "app_sg" {
  name        = "${var.project_name}-app-sg"
  description = "App SG"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description     = "HTTP from ALB"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.alb_sg.id]
  }

  dynamic "ingress" {
    for_each = var.allow_ssh ? { "ssh" = true } : {}
    content {
      description = "SSH (use SSM instead)"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = [var.ssh_ingress_cidr]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = local.tags
}

resource "aws_security_group" "rds_sg" {
  name        = "${var.project_name}-rds-sg"
  description = "RDS SG"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description     = "MySQL from app"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.app_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = local.tags
}

resource "aws_security_group" "efs_sg" {
  name        = "${var.project_name}-efs-sg"
  description = "EFS SG"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description     = "NFS from app"
    from_port       = 2049
    to_port         = 2049
    protocol        = "tcp"
    security_groups = [aws_security_group.app_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = local.tags
}

# ------------------------ RDS ------------------------
module "rds" {
  source                = "./modules/rds"
  project_name          = var.project_name
  vpc_id                = module.vpc.vpc_id
  db_subnet_ids         = module.vpc.private_db_subnet_ids
  security_group_ids    = [aws_security_group.rds_sg.id]
  db_name               = "wordpress"
  username              = var.rds_username
  password_ssm_name     = aws_ssm_parameter.db_password.name
  instance_class        = var.db_instance_class
  allocated_storage     = var.db_allocated_storage
  multi_az              = true
  storage_encrypted     = true
  deletion_protection   = false
  backup_retention_days = 7
  tags                  = local.tags
}

# ------------------------ EFS ------------------------
module "efs" {
  source             = "./modules/efs"
  project_name       = var.project_name
  vpc_id             = module.vpc.vpc_id
  subnet_ids         = module.vpc.private_app_subnet_ids
  security_group_ids = [aws_security_group.efs_sg.id]
  performance_mode   = "generalPurpose"
  throughput_mode    = "bursting"
  tags               = local.tags
}

# ------------------------ ALB ------------------------
module "alb" {
  source             = "./modules/alb"
  project_name       = var.project_name
  vpc_id             = module.vpc.vpc_id
  public_subnet_ids  = module.vpc.public_subnet_ids
  alb_sg_id          = aws_security_group.alb_sg.id
  enable_https       = var.enable_https
  domain_name        = var.domain_name
  tags               = local.tags
}

# ------------------------ ASG ------------------------
module "asg" {
  source               = "./modules/asg"
  project_name         = var.project_name
  private_subnet_ids   = module.vpc.private_app_subnet_ids
  instance_type        = var.wp_instance_type
  target_group_arn     = module.alb.target_group_arn
  sg_id                = aws_security_group.app_sg.id
  efs_id               = module.efs.efs_id
  efs_dns              = module.efs.efs_dns
  rds_endpoint         = module.rds.rds_endpoint
  db_name              = "wordpress"
  rds_username         = var.rds_username
  rds_password_ssm_name= aws_ssm_parameter.db_password.name
  desired_capacity     = var.desired_capacity
  min_size             = var.min_size
  max_size             = var.max_size
  tags                 = local.tags
}

