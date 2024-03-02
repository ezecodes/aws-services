resource "aws_db_subnet_group" "db_subnets" {
  name       = "db_subnets"
  subnet_ids = [var.primary_private_subnet_id, var.secondary_private_subnet_id]
}

resource "aws_db_instance" "mysql" {
  allocated_storage    = 10
  db_name              = "${var.project_name}_mysqldb"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  username             = var.mysql_user
  password             = var.mysql_password
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.db_subnets.name
}