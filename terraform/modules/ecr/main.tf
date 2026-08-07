resource "aws_ecr_repository" "frontend" {

  name                 = "bankcloud/frontend"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  encryption_configuration {
    encryption_type = "AES256"
  }

  tags = {
    Name        = "Frontend Repository"
    Environment = "dev"
    ManagedBy   = "Terraform"
  }
}

resource "aws_ecr_repository" "productcatalogservice" {

  name                 = "bankcloud/productcatalogservice"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  encryption_configuration {
    encryption_type = "AES256"
  }

  tags = {
    Name        = "Product Catalog Repository"
    Environment = "dev"
    ManagedBy   = "Terraform"
  }
}