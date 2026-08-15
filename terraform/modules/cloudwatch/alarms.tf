# ============================================================
# ECS - FRONTEND
# ============================================================

resource "aws_cloudwatch_metric_alarm" "frontend_cpu_high" {
  alarm_name          = "${var.project_name}-${var.environment}-frontend-cpu-high"
  alarm_description   = "CPU del servicio Frontend superior al 80%"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = 300
  statistic           = "Average"
  threshold           = 80
  treat_missing_data  = "notBreaching"

  dimensions = {
    ClusterName = "${var.project_name}-${var.environment}"
    ServiceName = "${var.project_name}-${var.environment}-frontend"
  }
}

resource "aws_cloudwatch_metric_alarm" "frontend_memory_high" {
  alarm_name          = "${var.project_name}-${var.environment}-frontend-memory-high"
  alarm_description   = "Memoria del servicio Frontend superior al 80%"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "MemoryUtilization"
  namespace           = "AWS/ECS"
  period              = 300
  statistic           = "Average"
  threshold           = 80
  treat_missing_data  = "notBreaching"

  dimensions = {
    ClusterName = "${var.project_name}-${var.environment}"
    ServiceName = "${var.project_name}-${var.environment}-frontend"
  }
}


# ============================================================
# ECS - PRODUCT CATALOG
# ============================================================

resource "aws_cloudwatch_metric_alarm" "productcatalog_cpu_high" {
  alarm_name          = "${var.project_name}-${var.environment}-productcatalog-cpu-high"
  alarm_description   = "CPU de ProductCatalog superior al 80%"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = 300
  statistic           = "Average"
  threshold           = 80
  treat_missing_data  = "notBreaching"

  dimensions = {
    ClusterName = "${var.project_name}-${var.environment}"
    ServiceName = "${var.project_name}-${var.environment}-productcatalogservice"
  }
}

resource "aws_cloudwatch_metric_alarm" "productcatalog_memory_high" {
  alarm_name          = "${var.project_name}-${var.environment}-productcatalog-memory-high"
  alarm_description   = "Memoria de ProductCatalog superior al 80%"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "MemoryUtilization"
  namespace           = "AWS/ECS"
  period              = 300
  statistic           = "Average"
  threshold           = 80
  treat_missing_data  = "notBreaching"

  dimensions = {
    ClusterName = "${var.project_name}-${var.environment}"
    ServiceName = "${var.project_name}-${var.environment}-productcatalogservice"
  }
}

