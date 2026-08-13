variable "project_name" {}

variable "environment" {}

variable "vpc_id" {}

variable "database_subnets" {
  type = list(string)
}

variable "ecs_security_group_id" {}

variable "db_name" {
  default = "bankcloud"
}

variable "db_username" {
  default = "postgres"
}

variable "instance_class" {
  default = "db.t4g.micro"
}

variable "allocated_storage" {
  default = 20
}