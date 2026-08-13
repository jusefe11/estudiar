resource "aws_service_discovery_private_dns_namespace" "this" {

  name        = "${var.project_name}.local"
  description = "Private DNS Namespace"
  vpc         = var.vpc_id

}

resource "aws_service_discovery_service" "productcatalogservice" {

  name = "${var.project_name}-${var.environment}-productcatalogservice"

  dns_config {

    namespace_id = aws_service_discovery_private_dns_namespace.this.id

    dns_records {
      ttl  = 10
      type = "A"
    }

    routing_policy = "MULTIVALUE"

  }

  health_check_custom_config {
    failure_threshold = 1
  }

}
