variable "project_name" {
  description = "Nombre del proyecto"
  type        = string
}

variable "environment" {
  description = "Ambiente"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR de la VPC"
  type        = string
}

variable "public_subnets" {
  description = "Lista de CIDR de las subredes públicas"
  type        = list(string)
}

variable "private_subnets" {
  description = "Lista de CIDR de las subredes privadas"
  type        = list(string)
}

variable "database_subnets" {
  description = "Lista de CIDR de las subredes de base de datos"
  type        = list(string)
}