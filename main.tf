provider "aws" {
  region = var.aws_region
}
module "vpc" {
  source = "./modules/vpc"
  project_name = var.project_name
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