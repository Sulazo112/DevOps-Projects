aws_region = "eu-west-1"

project_name = "digitalboost-wp"

vpc_cidr = "10.0.0.0/16"

azs = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]

public_subnet_cidrs      = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
private_app_subnet_cidrs = ["10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24"]
private_db_subnet_cidrs  = ["10.0.21.0/24", "10.0.22.0/24", "10.0.23.0/24"]

allow_ssh = false
ssh_ingress_cidr = "0.0.0.0/0"

enable_https = false
domain_name  = ""

rds_username        = "admin"
db_instance_class   = "db.t3.micro"
db_allocated_storage = 20

wp_instance_type = "t3.micro"

desired_capacity = 2
min_size         = 1
max_size         = 3

