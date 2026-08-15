resource "aws_cloudwatch_dashboard" "bankcloud" {
  dashboard_name = "${var.project_name}-${var.environment}-dashboard"

  dashboard_body = jsonencode({
    widgets = [

      # ======================================================
      # FRONTEND - CPU
      # ======================================================
      {
        type   = "metric"
        x      = 0
        y      = 0
        width  = 12
        height = 6

        properties = {
          title   = "Frontend - CPU Utilization"
          region  = "us-east-1"
          view    = "timeSeries"
          stacked = false
          period  = 300

          metrics = [
            [
              "AWS/ECS",
              "CPUUtilization",
              "ClusterName",
              "${var.project_name}-${var.environment}",
              "ServiceName",
              "${var.project_name}-${var.environment}-frontend"
            ]
          ]

          yAxis = {
            left = {
              min = 0
              max = 100
            }
          }
        }
      },

      # ======================================================
      # FRONTEND - MEMORY
      # ======================================================
      {
        type   = "metric"
        x      = 12
        y      = 0
        width  = 12
        height = 6

        properties = {
          title   = "Frontend - Memory Utilization"
          region  = "us-east-1"
          view    = "timeSeries"
          stacked = false
          period  = 300

          metrics = [
            [
              "AWS/ECS",
              "MemoryUtilization",
              "ClusterName",
              "${var.project_name}-${var.environment}",
              "ServiceName",
              "${var.project_name}-${var.environment}-frontend"
            ]
          ]

          yAxis = {
            left = {
              min = 0
              max = 100
            }
          }
        }
      },

      # ======================================================
      # PRODUCT CATALOG - CPU
      # ======================================================
      {
        type   = "metric"
        x      = 0
        y      = 6
        width  = 12
        height = 6

        properties = {
          title   = "ProductCatalog - CPU Utilization"
          region  = "us-east-1"
          view    = "timeSeries"
          stacked = false
          period  = 300

          metrics = [
            [
              "AWS/ECS",
              "CPUUtilization",
              "ClusterName",
              "${var.project_name}-${var.environment}",
              "ServiceName",
              "${var.project_name}-${var.environment}-productcatalogservice"
            ]
          ]

          yAxis = {
            left = {
              min = 0
              max = 100
            }
          }
        }
      },

      # ======================================================
      # PRODUCT CATALOG - MEMORY
      # ======================================================
      {
        type   = "metric"
        x      = 12
        y      = 6
        width  = 12
        height = 6

        properties = {
          title   = "ProductCatalog - Memory Utilization"
          region  = "us-east-1"
          view    = "timeSeries"
          stacked = false
          period  = 300

          metrics = [
            [
              "AWS/ECS",
              "MemoryUtilization",
              "ClusterName",
              "${var.project_name}-${var.environment}",
              "ServiceName",
              "${var.project_name}-${var.environment}-productcatalogservice"
            ]
          ]

          yAxis = {
            left = {
              min = 0
              max = 100
            }
          }
        }
      }
    ]
  })
}
