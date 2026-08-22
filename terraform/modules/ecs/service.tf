resource "aws_ecs_service" "frontend" {

  name            = "${var.project_name}-${var.environment}-frontend"
  cluster         = aws_ecs_cluster.this.id
  task_definition = aws_ecs_task_definition.frontend.arn

  desired_count = 2

  launch_type = "FARGATE"

  deployment_minimum_healthy_percent = 100
  deployment_maximum_percent         = 200

  health_check_grace_period_seconds = 120

  network_configuration {

    assign_public_ip = false

    security_groups = [
      var.ecs_security_group_id
    ]

    subnets = var.private_subnets

  }

  load_balancer {

    target_group_arn = var.frontend_target_group_arn

    container_name = "frontend"

    container_port = 80

  }

  depends_on = [
    aws_ecs_task_definition.frontend
  ]
}

resource "aws_ecs_service" "productcatalogservice" {

  name            = "${var.project_name}-${var.environment}-productcatalogservice"
  cluster         = aws_ecs_cluster.this.id
  task_definition = aws_ecs_task_definition.productcatalogservice.arn

  desired_count = 1

  launch_type = "FARGATE"

  deployment_minimum_healthy_percent = 100
  deployment_maximum_percent         = 200

  network_configuration {

    assign_public_ip = false

    security_groups = [
      var.ecs_security_group_id
    ]

    subnets = var.private_subnets

  }

  depends_on = [
    aws_ecs_task_definition.productcatalogservice
  ]
}