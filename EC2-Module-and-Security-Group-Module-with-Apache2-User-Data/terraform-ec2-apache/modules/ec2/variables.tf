variable "name_prefix" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "key_name" {
  type    = string
  default = null
}

variable "subnet_id" {
  type    = string
  default = null
}

variable "security_group_id" {
  type = string
}

variable "user_data" {
  type = string
}

