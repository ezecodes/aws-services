# iac-challenge

## Terraform Assignment: Multi-Region Infrastructure Deployment

### Task Overview
The goal of this assignment is to assess your ability to design and deploy a multi-region infrastructure using Terraform. You will be required to create modular Terraform scripts for provisioning the following resources:

- Virtual Private Cloud (VPC)
- Security Groups
- EC2 Instance
- S3 Bucket
- MySQL RDS
- WordPress Service
- Application Load Balancer (ALB) or DNS for WordPress Service

### Requirements

1. **Modular Approach:**
   - Implement a modular structure for Terraform scripts.
   - Organize code into separate modules for VPC, Security Groups, EC2, S3, RDS, and WordPress.
   - Ensure modules are reusable and can be configured for different regions.

2. **Multi-Region Deployment:**
   - Design Terraform scripts to support deployment in multiple AWS regions.

3. **Resource Configuration:**
   - Define resource configurations for each module.
   - Include appropriate security measures for EC2, RDS, and Security Groups.

4. **WordPress Service:**
   - Deploy WordPress on an EC2 instance within the VPC.
   - Implement an Application Load Balancer (ALB) or DNS to showcase the WordPress service.
   - Ensure that the ALB/DNS is accessible and displays the WordPress site.

5. **Documentation:**
   - Provide clear and concise documentation for each module.
   - Include an architecture diagram and any critical considerations.

### Evaluation Criteria

Your solution will be evaluated based on:

- Modularity: Effective use of modular code structures.
- Multi-Region Support: Ability to deploy resources in different AWS regions.
- Configuration Accuracy: Correct configuration of resources with appropriate security measures.
- Best Practices and Security: Adherence to Terraform and AWS best practices for code and resource configurations.
- WordPress Deployment: Successful deployment of WordPress on an EC2 instance with ALB/DNS accessibility.
- Documentation Quality: Clarity and completeness of documentation.
