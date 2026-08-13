#####################################
# S3 Gateway Endpoint
#####################################

resource "aws_vpc_endpoint" "s3" {

  vpc_id = aws_vpc.this.id

  service_name = "com.amazonaws.us-east-1.s3"

  route_table_ids = [
    aws_route_table.private.id
  ]

  vpc_endpoint_type = "Gateway"

}

#####################################
# ECR API Endpoint
#####################################

resource "aws_vpc_endpoint" "ecr_api" {

  vpc_id            = aws_vpc.this.id
  service_name      = "com.amazonaws.us-east-1.ecr.api"
  vpc_endpoint_type = "Interface"

  subnet_ids = aws_subnet.private[*].id

  security_group_ids = [
    aws_security_group.vpce.id
  ]

  private_dns_enabled = true

}

#####################################
# ECR Docker Endpoint
#####################################

resource "aws_vpc_endpoint" "ecr_dkr" {

  vpc_id            = aws_vpc.this.id
  service_name      = "com.amazonaws.us-east-1.ecr.dkr"
  vpc_endpoint_type = "Interface"

  subnet_ids = aws_subnet.private[*].id

  security_group_ids = [
    aws_security_group.vpce.id
  ]

  private_dns_enabled = true

}

#####################################
# CloudWatch Logs Endpoint
#####################################

resource "aws_vpc_endpoint" "logs" {

  vpc_id            = aws_vpc.this.id
  service_name      = "com.amazonaws.us-east-1.logs"
  vpc_endpoint_type = "Interface"

  subnet_ids = aws_subnet.private[*].id

  security_group_ids = [
    aws_security_group.vpce.id
  ]

  private_dns_enabled = true

}

#####################################
# STS Endpoint
#####################################

resource "aws_vpc_endpoint" "sts" {

  vpc_id            = aws_vpc.this.id
  service_name      = "com.amazonaws.us-east-1.sts"
  vpc_endpoint_type = "Interface"

  subnet_ids = aws_subnet.private[*].id

  security_group_ids = [
    aws_security_group.vpce.id
  ]

  private_dns_enabled = true

  tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}