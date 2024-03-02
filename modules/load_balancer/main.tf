resource "aws_lb" "load_balancer" {
  name                       = "load_balancer"
  load_balancer_type         = "network"
  security_groups            = [var.lb_sg]
  subnets                    = [var.primary_public_subnet_id, var.secondary_public_subnet_id]
  idle_timeout               = 300
  enable_deletion_protection = true

  tags = {
    name = "${var.project_name}-elb"
  }
}