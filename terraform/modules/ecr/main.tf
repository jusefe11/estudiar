locals {
  repositories = {
    frontend                 = "Frontend Repository"
    productcatalogservice    = "Product Catalog Repository"
    currencyservice          = "Currency Service Repository"
    cartservice              = "Cart Service Repository"
    recommendationservice    = "Recommendation Service Repository"
    checkoutservice          = "Checkout Service Repository"
    shippingservice          = "Shipping Service Repository"
    adservice                = "Ad Service Repository"
    shoppingassistantservice = "Shopping Assistant Repository"
  }
}

resource "aws_ecr_repository" "this" {

  for_each = local.repositories

  name                 = "bankcloud/${each.key}"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  encryption_configuration {
    encryption_type = "AES256"
  }

  tags = {
    Name        = each.value
    Environment = "dev"
    ManagedBy   = "Terraform"
  }
}