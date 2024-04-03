# Overview
This is a cloud-native design that includes components like a load balancer for distributing traffic, auto-scaling groups for managing compute resources, and a managed database service for data storage.
# Infrastructure Design Documentation

## VPC with Public and Private Subnets

- **Overview:** 
  - The VPC is configured with both a public and private subnets across multiple Availability Zones (AZs) for high availability.
  - Public subnets are designed for resources that need to be accessible from the internet, such as load balancers.
  - Private subnets are used for resources that should not be directly accessible from the internet, such as databases and application servers.

## MySQL RDS Instance in Private Subnet across multi AZs
-  **Overview:** 
  - Placing the RDS instance in a private subnet enhances security by isolating it from direct internet access.
  - Multi-AZ deployment provides automatic failover to a standby instance in a different Availability Zone, ensuring high availability.
  - Distribution across multiple Availability Zones improves fault tolerance, allowing the database to remain operational during AZ failures.


## Security Groups

- **EC2 Security Group:**
  - Inbound Rules: Allow traffic on port 80 (HTTP) and port 22 (SSH) from specific IP addresses or ranges as needed.

- **Load Balancer Security Group:**
  - Inbound Rules: Allow traffic on port 80 from the internet.
  - Outbound Rules: Allow traffic to EC2 instances in the private subnet.

## Load Balancer in Public Subnet

- **Configuration:**
  - The load balancer is deployed in the public subnets to distribute incoming traffic across EC2 instances in the private subnet.
  - It is configured with a listener on port 80 to route HTTP traffic.

## S3 Bucket

- **Configuration:**
  - Name: your-s3-bucket-name
