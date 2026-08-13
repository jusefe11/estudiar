resource "aws_cloudwatch_log_group" "frontend" {

  name = "/ecs/${var.project_name}-${var.environment}-frontend"

  retention_in_days = 30

}

resource "aws_cloudwatch_log_group" "productcatalogservice" {

  name = "/ecs/${var.project_name}-${var.environment}-productcatalogservice"

  retention_in_days = 30

}
