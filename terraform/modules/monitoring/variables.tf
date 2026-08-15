variable "project_name" {
  description = "Nombre del proyecto"
  type        = string
}

variable "environment" {
  description = "Ambiente"
  type        = string
}

variable "cluster_id" {
  description = "ID/ARN del cluster ECS"
  type        = string
}

variable "private_subnets" {
  description = "Subredes privadas para monitoring"
  type        = list(string)
}

variable "monitoring_security_group_id" {
  description = "Security Group para Prometheus y Grafana"
  type        = string
}

variable "execution_role_arn" {
  description = "ECS Task Execution Role"
  type        = string
}

variable "task_role_arn" {
  description = "ECS Task Role"
  type        = string
}