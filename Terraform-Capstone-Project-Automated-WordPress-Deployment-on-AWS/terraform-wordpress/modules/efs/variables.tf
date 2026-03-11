variable "project_name" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "security_group_ids" {
  type = list(string)
}

variable "performance_mode" {
  type = string
}

variable "throughput_mode" {
  type = string
}

variable "tags" {
  type = map(string)
}

