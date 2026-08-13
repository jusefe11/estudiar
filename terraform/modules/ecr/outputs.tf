output "frontend_repository_url" {
  description = "URL del repositorio Frontend"
  value       = aws_ecr_repository.this["frontend"].repository_url
}

output "productcatalog_repository_url" {
  description = "URL del repositorio Product Catalog"
  value       = aws_ecr_repository.this["productcatalogservice"].repository_url
}

output "repositories" {
  description = "Todos los repositorios ECR"
  value = {
    for k, v in aws_ecr_repository.this :
    k => v.repository_url
  }
}