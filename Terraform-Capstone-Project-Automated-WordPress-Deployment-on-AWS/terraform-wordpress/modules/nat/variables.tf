variable "project_name" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "public_route_table_ids" {
  type = list(string)
}

variable "private_route_table_ids" {
  type = list(string)
}

variable "single_nat_gateway" {
  type = bool
}

variable "tags" {
  type = map(string)
}

