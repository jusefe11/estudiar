resource "aws_vpc" "this" {

  cidr_block = var.vpc_cidr

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.project_name}-${var.environment}-vpc"
  }

}

data "aws_availability_zones" "available" {
  state = "available"
}

#####################################
# Public Subnets
#####################################

resource "aws_subnet" "public" {

  count = length(var.public_subnets)

  vpc_id = aws_vpc.this.id

  cidr_block = var.public_subnets[count.index]

  availability_zone = data.aws_availability_zones.available.names[count.index]

  map_public_ip_on_launch = true

  tags = {
    Name = "${var.project_name}-${var.environment}-public-${count.index + 1}"
  }

}

#####################################
# Private Subnets
#####################################

resource "aws_subnet" "private" {

  count = length(var.private_subnets)

  vpc_id = aws_vpc.this.id

  cidr_block = var.private_subnets[count.index]

  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = "${var.project_name}-${var.environment}-private-${count.index + 1}"
  }

}

#####################################
# Database Subnets
#####################################

resource "aws_subnet" "database" {

  count = length(var.database_subnets)

  vpc_id = aws_vpc.this.id

  cidr_block = var.database_subnets[count.index]

  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = "${var.project_name}-${var.environment}-database-${count.index + 1}"
  }

}