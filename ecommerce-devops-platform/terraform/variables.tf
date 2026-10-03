variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "project_name" {
  type    = string
  default = "ecommerce-devops"
}

variable "vpc_cidr" {
  type    = string
  default = "10.20.0.0/16"
}
