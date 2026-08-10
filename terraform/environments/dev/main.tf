module "vpc" {

  source = "../../modules/vpc"

  project_name     = var.project_name
  environment      = var.environment
  vpc_cidr         = var.vpc_cidr
  public_subnets   = var.public_subnets
  private_subnets  = var.private_subnets
  database_subnets = var.database_subnets

}

module "ecr" {

  source = "../../modules/ecr"

}

module "ecs" {

  source = "../../modules/ecs"

  project_name = var.project_name
  environment  = var.environment

}

module "cloudwatch" {

  source = "../../modules/cloudwatch"

  project_name = var.project_name
  environment  = var.environment

}

module "iam" {

  source = "../../modules/iam"

  project_name = var.project_name
  environment  = var.environment

}

