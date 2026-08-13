output "cluster_name" {
  description = "Nombre del ECS Cluster"
  value       = aws_ecs_cluster.this.name
}

output "cluster_arn" {
  description = "ARN del ECS Cluster"
  value       = aws_ecs_cluster.this.arn
}