aws_region   = "us-east-1"
environment  = "dev"
project_name = "bankcloud"

vpc_cidr = "10.0.0.0/16"

public_subnets = [
  "10.0.1.0/24",
  "10.0.2.0/24"
]

private_subnets = [
  "10.0.10.0/24",
  "10.0.20.0/24"
]

database_subnets = [
  "10.0.30.0/24",
  "10.0.40.0/24"
]