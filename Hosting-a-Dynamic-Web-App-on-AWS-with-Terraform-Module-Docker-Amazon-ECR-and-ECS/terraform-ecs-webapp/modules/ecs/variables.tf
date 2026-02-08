variable "app_name" {
  type        = string
  description = "Name of the application"
}

variable "image_url" {
  type        = string
  description = "Full ECR image URL for the container"
}

variable "region" {
  type        = string
  description = "AWS region where resources will be deployed"
}

