resource "aws_kms_key" "rds" {
  description             = "KMS Key for RDS"
  deletion_window_in_days = 7
  enable_key_rotation     = true
}

resource "aws_security_group" "rds" {
  name        = "${var.project_name}-${var.environment}-rds-sg"
  description = "Security Group for RDS"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [var.ecs_security_group_id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-${var.environment}-rds-sg"
  }
}

resource "aws_db_subnet_group" "this" {
  name = "${var.project_name}-${var.environment}-db-subnet"

  subnet_ids = var.database_subnets

  tags = {
    Name = "${var.project_name}-${var.environment}-db-subnet"
  }
}

resource "random_password" "db" {
  length  = 20
  special = true
}

resource "aws_secretsmanager_secret" "db" {
  name = "${var.project_name}-${var.environment}-db-secret"
}

resource "aws_secretsmanager_secret_version" "db" {
  secret_id = aws_secretsmanager_secret.db.id

  secret_string = jsonencode({
    username = "postgres"
    password = random_password.db.result
    endpoint = aws_db_instance.postgres.address
    port     = aws_db_instance.postgres.port
    database = aws_db_instance.postgres.db_name
  })
}

resource "aws_db_instance" "postgres" {
  identifier = "${var.project_name}-${var.environment}-postgres"

  engine         = "postgres"
  engine_version = "17.5"

  instance_class = var.instance_class

  allocated_storage     = 20
  max_allocated_storage = 100

  db_name  = "bankcloud"
  username = "postgres"
  password = random_password.db.result

  db_subnet_group_name   = aws_db_subnet_group.this.name
  vpc_security_group_ids = [aws_security_group.rds.id]

  multi_az            = true
  publicly_accessible = false

  storage_encrypted = true
  kms_key_id         = aws_kms_key.rds.arn

  # Free Tier
  backup_retention_period = 1

  backup_window      = "03:00-04:00"
  maintenance_window = "Sun:04:00-Sun:05:00"

  skip_final_snapshot = true
  deletion_protection = false
  apply_immediately   = true

  tags = {
    Name = "${var.project_name}-${var.environment}-postgres"
  }
}

resource "aws_db_parameter_group" "postgres" {
  name   = "${var.project_name}-${var.environment}-pg"
  family = "postgres17"

  parameter {
    name  = "log_connections"
    value = "1"
  }

  parameter {
    name  = "log_disconnections"
    value = "1"
  }

  tags = {
    Name = "${var.project_name}-${var.environment}-pg"
  }
}