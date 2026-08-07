output "frontend_repository_url" {
  value = aws_ecr_repository.frontend.repository_url
}

output "productcatalog_repository_url" {
  value = aws_ecr_repository.productcatalogservice.repository_url
}