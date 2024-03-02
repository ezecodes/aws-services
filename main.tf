provider "aws" {
  region = var.aws_region
}
module "vpc" {
  source = "./modules/vpc"
  project_name = var.project_name
  cidr_vpc = var.cidr_vpc
  cidr_private_primary_subnet = var.cidr_private_primary_subnet
  cidr_private_secondary_subnet = var.cidr_private_secondary_subnet
  cidr_public_primary_subnet = var.cidr_public_primary_subnet
  cidr_public_secondary_subnet = var.cidr_public_secondary_subnet
  cidr_route_table = var.cidr_route_table
}
module "mysql" {
  source = "./modules/mysql"
  project_name = var.project_name
  mysql_password = var.mysql_password
  mysql_user = var.mysql_user
}
module "ec2" {
  source = "./modules/ec2"
  project_name = var.project_name
}