variable "project_name" {
  type = string
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "instance_type" {
  type = string
}

variable "target_group_arn" {
  type = string
}

variable "app_sg_id" {
  type = string
}

variable "efs_id" {
  type = string
}

variable "efs_dns_name" {
  type = string
}

variable "rds_endpoint" {
  type = string
}

variable "rds_db_name" {
  type = string
}

variable "rds_username" {
  type = string
}

variable "rds_password_ssm_name" {
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

variable "tags" {
  type = map(string)
}

