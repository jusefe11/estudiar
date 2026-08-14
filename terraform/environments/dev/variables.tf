variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Ambiente"
  type        = string
}

variable "project_name" {
  description = "Nombre del proyecto"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR de la VPC"
  type        = string
}

variable "public_subnets" {
  type = list(string)
}

variable "private_subnets" {
  type = list(string)
}

variable "database_subnets" {
  description = "Subredes para RDS"
  type        = list(string)
}

variable "image_tag" {
  description = "Tag de las imagenes Docker para ECS"
  type        = string
  default     = "latest"
}