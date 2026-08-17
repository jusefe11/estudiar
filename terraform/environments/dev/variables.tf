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

variable "frontend_image_tag" {
  description = "Tag de las imagenes Docker para ECS"
  type        = string
  default     = "latest"
}


variable "productcatalog_image_tag" {
  description = "Tag Docker de Product Catalog"
  type        = string
  default     = "0b6a28fc3b749c4c5e0a30e0cefa9f101d346e8c"
}
variable "image_tag" {
  description = "Tag de las imagenes Docker desplegadas en ECS"
  type        = string
  default     = "latest"
}
