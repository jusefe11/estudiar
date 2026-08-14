variable "project_name" {
  description = "Nombre del proyecto"
  type        = string
}

variable "environment" {
  description = "Ambiente"
  type        = string
}

variable "execution_role_arn" {
  type = string
}

variable "task_role_arn" {
  type = string
}



variable "frontend_repository_url" {
  type = string
}

variable "productcatalog_repository_url" {
  type = string
}

variable "private_subnets" {
  description = "Subredes privadas para ECS"
  type        = list(string)
}

variable "ecs_security_group_id" {
  description = "Security Group de ECS"
  type        = string
}

variable "frontend_target_group_arn" {
  description = "Target Group Frontend"
  type        = string
}

variable "productcatalog_target_group_arn" {
  description = "Target Group Backend"
  type        = string
}

variable "image_tag" {
  description = "Tag de las imagenes Docker desplegadas en ECS"
  type        = string
  default     = "latest"
}