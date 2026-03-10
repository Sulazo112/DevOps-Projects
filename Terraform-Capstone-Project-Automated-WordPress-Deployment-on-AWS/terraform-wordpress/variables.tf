variable "project_name" {
  type        = string
  default     = "digitalboost-wp"
  description = "Project identifier used for tagging and naming."
}

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  type    = list(string)
  default = ["10.0.0.0/24", "10.0.1.0/24"]
}

variable "private_app_subnet_cidrs" {
  type    = list(string)
  default = ["10.0.10.0/24", "10.0.11.0/24"]
}

variable "private_db_subnet_cidrs" {
  type    = list(string)
  default = ["10.0.20.0/24", "10.0.21.0/24"]
}

variable "azs" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b"]
}

variable "rds_username" {
  type    = string
  default = "wpadmin"
}

variable "db_instance_class" {
  type    = string
  default = "db.t3.micro"
}

variable "db_allocated_storage" {
  type    = number
  default = 20
}

variable "wp_instance_type" {
  type    = string
  default = "t3.micro"
}

variable "desired_capacity" {
  type    = number
  default = 2
}

variable "min_size" {
  type    = number
  default = 2
}

variable "max_size" {
  type    = number
  default = 5
}

variable "domain_name" {
  type        = string
  default     = ""
  description = "Optional: your domain for ALB (use with ACM for HTTPS)."
}

variable "enable_https" {
  type    = bool
  default = false
}

variable "allow_ssh" {
  type        = bool
  default     = false
  description = "Keep false (we use SSM). If true, restrict the source CIDR."
}

variable "ssh_ingress_cidr" {
  type    = string
  default = "0.0.0.0/0"
}

