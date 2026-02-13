variable "name_prefix" {
  description = "Name prefix for the security group"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID; if null, default VPC is used"
  type        = string
  default     = null
}

variable "allowed_ssh" {
  description = "CIDR allowed to access SSH (22)"
  type        = string
  default     = "0.0.0.0/0"
}

