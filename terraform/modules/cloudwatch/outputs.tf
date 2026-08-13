output "frontend_log_group" {
  value = aws_cloudwatch_log_group.frontend.name
}

output "productcatalogservice_log_group" {
  value = aws_cloudwatch_log_group.productcatalogservice.name
}