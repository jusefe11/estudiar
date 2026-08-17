resource "aws_ecs_task_definition" "frontend" {

  family = "${var.project_name}-${var.environment}-frontend"

  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"

  cpu    = 256
  memory = 512

  execution_role_arn = var.execution_role_arn
  task_role_arn      = var.task_role_arn

  container_definitions = jsonencode([
    {
      name      = "frontend"
      image     = "${var.frontend_repository_url}:${var.frontend_image_tag}"
      essential = true

      environment = [
        {
          name  = "PRODUCT_CATALOG_SERVICE_ADDR"
          value = "bankcloud-dev-productcatalogservice:3550"
        }
      ]

      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
          protocol      = "tcp"
        }
      ]

      logConfiguration = {
        logDriver = "awslogs"

        options = {
          awslogs-group         = "/ecs/${var.project_name}-${var.environment}-frontend"
          awslogs-region        = "us-east-1"
          awslogs-stream-prefix = "ecs"
        }
      }
    }
  ])
}


resource "aws_ecs_task_definition" "productcatalogservice" {

  family = "${var.project_name}-${var.environment}-productcatalogservice"

  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"

  cpu    = 512
  memory = 1024

  execution_role_arn = var.execution_role_arn
  task_role_arn      = var.task_role_arn

  container_definitions = jsonencode([
    {
      name      = "productcatalogservice"
      image     = "${var.productcatalog_repository_url}:${var.productcatalog_image_tag}"
      essential = true

      portMappings = [
        {
          containerPort = 3550
          hostPort      = 3550
          protocol      = "tcp"
        }
      ]

      logConfiguration = {
        logDriver = "awslogs"

        options = {
          awslogs-group         = "/ecs/${var.project_name}-${var.environment}-productcatalogservice"
          awslogs-region        = "us-east-1"
          awslogs-stream-prefix = "ecs"
        }
      }
    }
  ])
}
