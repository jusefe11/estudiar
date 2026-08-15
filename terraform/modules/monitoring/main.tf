# ============================================================
# BANKCLOUD - MONITORING
# Prometheus + Grafana sobre ECS Fargate
# ============================================================


# ============================================================
# CLOUDWATCH LOG GROUP - PROMETHEUS
# ============================================================

resource "aws_cloudwatch_log_group" "prometheus" {
  name              = "/ecs/${var.project_name}-${var.environment}-prometheus"
  retention_in_days = 30

  tags = {
    Project     = var.project_name
    Environment = var.environment
    Service     = "prometheus"
  }
}


# ============================================================
# CLOUDWATCH LOG GROUP - GRAFANA
# ============================================================

resource "aws_cloudwatch_log_group" "grafana" {
  name              = "/ecs/${var.project_name}-${var.environment}-grafana"
  retention_in_days = 30

  tags = {
    Project     = var.project_name
    Environment = var.environment
    Service     = "grafana"
  }
}


# ============================================================
# PROMETHEUS - ECS TASK DEFINITION
# ============================================================

resource "aws_ecs_task_definition" "prometheus" {
  family                   = "${var.project_name}-${var.environment}-prometheus"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"

  cpu    = 256
  memory = 512

  execution_role_arn = var.execution_role_arn
  task_role_arn      = var.task_role_arn

  container_definitions = jsonencode([
    {
      name      = "prometheus"
      image     = "prom/prometheus:latest"
      essential = true

      portMappings = [
        {
          containerPort = 9090
          hostPort      = 9090
          protocol      = "tcp"
        }
      ]

      logConfiguration = {
        logDriver = "awslogs"

        options = {
          awslogs-group         = aws_cloudwatch_log_group.prometheus.name
          awslogs-region        = "us-east-1"
          awslogs-stream-prefix = "ecs"
        }
      }
    }
  ])

  depends_on = [
    aws_cloudwatch_log_group.prometheus
  ]

  tags = {
    Project     = var.project_name
    Environment = var.environment
    Service     = "prometheus"
  }
}


# ============================================================
# PROMETHEUS - ECS SERVICE
# ============================================================

resource "aws_ecs_service" "prometheus" {
  name            = "${var.project_name}-${var.environment}-prometheus"
  cluster         = var.cluster_id
  task_definition = aws_ecs_task_definition.prometheus.arn

  desired_count = 1
  launch_type   = "FARGATE"

  deployment_minimum_healthy_percent = 100
  deployment_maximum_percent         = 200

  network_configuration {
    assign_public_ip = false

    subnets = var.private_subnets

    security_groups = [
      var.monitoring_security_group_id
    ]
  }

  depends_on = [
    aws_ecs_task_definition.prometheus
  ]

  tags = {
    Project     = var.project_name
    Environment = var.environment
    Service     = "prometheus"
  }
}


# ============================================================
# GRAFANA - ECS TASK DEFINITION
# ============================================================

resource "aws_ecs_task_definition" "grafana" {
  family                   = "${var.project_name}-${var.environment}-grafana"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"

  cpu    = 256
  memory = 512

  execution_role_arn = var.execution_role_arn
  task_role_arn      = var.task_role_arn

  container_definitions = jsonencode([
    {
      name      = "grafana"
      image     = "grafana/grafana:latest"
      essential = true

      portMappings = [
        {
          containerPort = 3000
          hostPort      = 3000
          protocol      = "tcp"
        }
      ]

      logConfiguration = {
        logDriver = "awslogs"

        options = {
          awslogs-group         = aws_cloudwatch_log_group.grafana.name
          awslogs-region        = "us-east-1"
          awslogs-stream-prefix = "ecs"
        }
      }
    }
  ])

  depends_on = [
    aws_cloudwatch_log_group.grafana
  ]

  tags = {
    Project     = var.project_name
    Environment = var.environment
    Service     = "grafana"
  }
}


# ============================================================
# GRAFANA - ECS SERVICE
# ============================================================

resource "aws_ecs_service" "grafana" {
  name            = "${var.project_name}-${var.environment}-grafana"
  cluster         = var.cluster_id
  task_definition = aws_ecs_task_definition.grafana.arn

  desired_count = 1
  launch_type   = "FARGATE"

  deployment_minimum_healthy_percent = 100
  deployment_maximum_percent         = 200

  network_configuration {
    assign_public_ip = false

    subnets = var.private_subnets

    security_groups = [
      var.monitoring_security_group_id
    ]
  }

  depends_on = [
    aws_ecs_task_definition.grafana
  ]

  tags = {
    Project     = var.project_name
    Environment = var.environment
    Service     = "grafana"
  }
}