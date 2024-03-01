resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  instance_tenancy = "default"
  enable_dns_hostnames = true
  tags = {
    Name = "${var.project_name}-vpc"
  }
}

data "aws_availability_zones" "available_zones" {
  state = "available"
}

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.project_name}-internet gateway"
  }
}

resource "aws_subnet" "primary_public_subnet" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.cidr_primary_public
  map_public_ip_on_launch = true
  availability_zone = data.aws_availability_zones.available_zones.names[0]
  tags = {
    Name = "${var.project_name}-public_subnets"
  }
}
resource "aws_subnet" "secondary_public_subnet" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.cidr_secondary_public
  map_public_ip_on_launch = true
  availability_zone = data.aws_availability_zones.available_zones.names[1]
  tags = {
    Name = "${var.project_name}-public_subnets"
  }
}
resource "aws_subnet" "primary_private_subnet" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.cidr_primary_private
  map_public_ip_on_launch = false
  availability_zone = data.aws_availability_zones.available_zones.names[0]
  tags = {
    Name = "${var.project_name}-private_subnets"
  }
}
resource "aws_subnet" "secondary_private_subnet" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.cidr_secondary_private
  map_customer_owned_ip_on_launch = false
  availability_zone = data.aws_availability_zones.available_zones.names[1]
  tags = {
    Name = "${var.project_name}-private_subnets"
  }
}
resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/24"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }
  tags = {
    Name = "${var.project_name}-route_tables"
  }
}

resource "aws_route_table_association" "primary_route_table_assoc" {
  route_table_id = aws_route_table.route_table.id
  subnet_id = aws_subnet.primary_public_subnet.id
}
resource "aws_route_table_association" "secondary_route_table_assoc" {
  route_table_id = aws_route_table.route_table.id
  subnet_id = aws_subnet.secondary_public_subnet.id
}