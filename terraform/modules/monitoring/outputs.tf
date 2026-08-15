output "prometheus_service_name" {
  description = "Nombre del servicio ECS de Prometheus"
  value       = aws_ecs_service.prometheus.name
}

output "grafana_service_name" {
  description = "Nombre del servicio ECS de Grafana"
  value       = aws_ecs_service.grafana.name
}

output "prometheus_task_definition_arn" {
  description = "ARN de la Task Definition de Prometheus"
  value       = aws_ecs_task_definition.prometheus.arn
}

output "grafana_task_definition_arn" {
  description = "ARN de la Task Definition de Grafana"
  value       = aws_ecs_task_definition.grafana.arn
}