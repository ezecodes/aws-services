provider "aws" {
  region = var.aws_region
}
module "vpc" {
  source                        = "./modules/vpc"
  project_name                  = var.project_name
  cidr_vpc                      = var.cidr_vpc
  cidr_private_primary_subnet   = var.cidr_private_primary_subnet
  cidr_private_secondary_subnet = var.cidr_private_secondary_subnet
  cidr_public_primary_subnet    = var.cidr_public_primary_subnet
  cidr_public_secondary_subnet  = var.cidr_public_secondary_subnet
  cidr_route_table              = var.cidr_route_table
}
module "mysql" {
  source                      = "./modules/mysql"
  project_name                = var.project_name
  mysql_password              = var.mysql_password
  mysql_user                  = var.mysql_user
  primary_private_subnet_id   = module.vpc.primary_private_subnet_id
  secondary_private_subnet_id = module.vpc.secondary_private_subnet_id
}
module "ec2_sg" {
  source       = "./modules/security_groups"
  vpc_id       = module.vpc.vpc_id
  project_name = var.project_name
}
module "ec2" {
  source                     = "./modules/ec2"
  project_name               = var.project_name
  secondary_public_subnet_id = module.vpc.secondary_public_subnet_id
  primary_public_subnet_id   = module.vpc.primary_public_subnet_id
  ec2_sg                     = module.ec2_sg.id
}
module "lb_sg" {
  source       = "./modules/security_groups"
  vpc_id       = module.vpc.vpc_id
  project_name = var.project_name
}
module "load_balancer" {
  source                     = "./modules/load_balancer"
  project_name               = var.project_name
  lb_sg                      = module.lb_sg.id
  secondary_public_subnet_id = module.vpc.secondary_public_subnet_id
  primary_public_subnet_id   = module.vpc.primary_public_subnet_id
}
module "s3_bucket" {
  source         = "./modules/s3"
  project_name   = var.project_name
  s3_bucket_name = var.s3_bucket_name
}