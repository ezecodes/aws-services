data "aws_ami" "ubuntu" {
  owners = ["self"]
  most_recent = true
  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }
}
module "vpc" {
  source = "../vpc"
  project_name = var.project_name
}
resource "aws_instance" "api_server" {
  ami = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  network_interface {
    device_index = 0
    network_interface_id = module.vpc.primary_public_subnet_id
  }
  network_interface {
    device_index = 1
    network_interface_id = module.vpc.secondary_public_subnet_id
  }
  tags = {
    Name = "${var.project_name}-api servers"
  }
}