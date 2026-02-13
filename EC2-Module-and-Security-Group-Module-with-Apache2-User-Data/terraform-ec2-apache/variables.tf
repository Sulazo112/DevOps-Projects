variable "aws_region" {
  description = "AWS region for all resources"
  type        = string
  default     = "eu-west-1"
}

variable "project_name" {
  description = "A name prefix for tagging"
  type        = string
  default     = "tf-ec2-apache"
}

variable "vpc_id" {
  description = "VPC ID to launch in (optional). If null, default VPC is used."
  type        = string
  default     = null
}

variable "public_subnet_id" {
  description = "Public subnet ID to use (optional). If null, a default subnet is used."
  type        = string
  default     = null
}

variable "key_name" {
  description = "Existing EC2 Key Pair name to allow SSH access (optional)"
  type        = string
  default     = null
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "allowed_ssh_cidr" {
  description = "CIDR allowed to SSH (22). Set to your IP for security."
  type        = string
  default     = "0.0.0.0/0"
}

