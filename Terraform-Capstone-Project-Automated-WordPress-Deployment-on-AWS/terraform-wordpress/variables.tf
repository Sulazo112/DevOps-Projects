variable "aws_region" {
  type = string
}

variable "project_name" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "azs" {
  type = list(string)
}

variable "public_subnet_cidrs" {
  type = list(string)
}

variable "private_app_subnet_cidrs" {
  type = list(string)
}

variable "private_db_subnet_cidrs" {
  type = list(string)
}

variable "allow_ssh" {
  type    = bool
  default = false
}

variable "ssh_ingress_cidr" {
  type    = string
  default = "0.0.0.0/0"
}

variable "enable_https" {
  type    = bool
  default = false
}

variable "domain_name" {
  type    = string
  default = ""
}

variable "rds_username" {
  type = string
}

variable "db_instance_class" {
  type = string
}

variable "db_allocated_storage" {
  type = number
}

variable "wp_instance_type" {
  type = string
}

variable "desired_capacity" {
  type = number
}

variable "min_size" {
  type = number
}

variable "max_size" {
  type = number
}

