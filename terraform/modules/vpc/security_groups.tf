#####################################
# ALB Security Group
#####################################

resource "aws_security_group" "alb" {

  name        = "${var.project_name}-${var.environment}-alb"
  description = "ALB Security Group"
  vpc_id      = aws_vpc.this.id

  ingress {
    description = "HTTP"

    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS"

    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {

    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }

  tags = {
    Name        = "${var.project_name}-${var.environment}-alb"
    Project     = var.project_name
    Environment = var.environment
  }

}

#####################################
# ECS Security Group
#####################################

resource "aws_security_group" "ecs" {

  name        = "${var.project_name}-${var.environment}-ecs"
  description = "ECS Security Group"
  vpc_id      = aws_vpc.this.id

  ingress {

    description = "Frontend"

    from_port = 8080
    to_port   = 8080
    protocol  = "tcp"

    security_groups = [
      aws_security_group.alb.id
    ]

  }

  ingress {

    description = "Product Catalog"

    from_port = 3550
    to_port   = 3550
    protocol  = "tcp"

    security_groups = [
      aws_security_group.alb.id
    ]

  }

  egress {

    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }

  tags = {
    Name        = "${var.project_name}-${var.environment}-ecs"
    Project     = var.project_name
    Environment = var.environment
  }

}

#####################################
# VPC Endpoint Security Group
#####################################

resource "aws_security_group" "vpce" {

  name        = "${var.project_name}-${var.environment}-vpce"
  description = "VPC Endpoint Security Group"
  vpc_id      = aws_vpc.this.id

  ingress {

    description = "HTTPS from ECS"

    from_port = 443
    to_port   = 443
    protocol  = "tcp"

    security_groups = [
      aws_security_group.ecs.id
    ]

  }

  egress {

    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }

  tags = {
    Name        = "${var.project_name}-${var.environment}-vpce"
    Project     = var.project_name
    Environment = var.environment
  }

}

#####################################
# Monitoring Security Group
#####################################

resource "aws_security_group" "monitoring" {
  name        = "${var.project_name}-${var.environment}-monitoring"
  description = "Security Group for Prometheus and Grafana"
  vpc_id      = aws_vpc.this.id

  # Grafana accesible desde el ALB
  ingress {
    description = "Grafana from ALB"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"

    security_groups = [
      aws_security_group.alb.id
    ]
  }

  # Prometheus accesible desde servicios de monitoring
  ingress {
    description = "Prometheus internal monitoring"
    from_port   = 9090
    to_port     = 9090
    protocol    = "tcp"
    self        = true
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.project_name}-${var.environment}-monitoring"
    Project     = var.project_name
    Environment = var.environment
  }
}