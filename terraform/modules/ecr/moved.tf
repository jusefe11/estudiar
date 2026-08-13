moved {
  from = aws_ecr_repository.frontend
  to   = aws_ecr_repository.this["frontend"]
}

moved {
  from = aws_ecr_repository.productcatalogservice
  to   = aws_ecr_repository.this["productcatalogservice"]
}