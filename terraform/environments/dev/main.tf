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

  execution_role_arn = module.iam.execution_role_arn
  task_role_arn      = module.iam.task_role_arn

  frontend_repository_url       = module.ecr.frontend_repository_url
  productcatalog_repository_url = module.ecr.productcatalog_repository_url

  private_subnets = module.vpc.private_subnet_ids

  ecs_security_group_id = module.vpc.ecs_security_group_id

  frontend_target_group_arn = module.alb.frontend_target_group_arn

  productcatalog_target_group_arn = module.alb.productcatalog_target_group_arn

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

module "alb" {

  source = "../../modules/alb"

  project_name = var.project_name
  environment  = var.environment

  vpc_id                = module.vpc.vpc_id
  public_subnets        = module.vpc.public_subnet_ids
  alb_security_group_id = module.vpc.alb_security_group_id
}

module "cloudmap" {

  source = "../../modules/cloudmap"

  project_name = var.project_name
  environment  = var.environment

  vpc_id = module.vpc.vpc_id

}

module "rds" {

  source = "../../modules/rds"

  project_name = var.project_name
  environment  = var.environment

  vpc_id = module.vpc.vpc_id

  database_subnets = module.vpc.database_subnet_ids

  ecs_security_group_id = module.vpc.ecs_security_group_id

}