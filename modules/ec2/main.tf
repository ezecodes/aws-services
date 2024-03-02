data "aws_ami" "ubuntu" {
  owners      = ["self"]
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
resource "aws_instance" "ec2" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  count         = 2

  security_groups = [var.ec2_sg]

  network_interface {
    device_index         = 0
    network_interface_id = var.primary_public_subnet_id
  }
  network_interface {
    device_index         = 1
    network_interface_id = var.secondary_public_subnet_id
  }
  tags = {
    Name = "${var.project_name}-api servers"
  }
}