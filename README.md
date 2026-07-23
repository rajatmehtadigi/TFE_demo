# Terraform Enterprise AWS Demo

This project creates:

- AWS VPC
- Internet Gateway
- Public Subnet
- Public Route Table
- Security Group
- Ubuntu EC2 Instance
- Nginx Web Server

## Architecture

Internet
    |
Internet Gateway
    |
Public Subnet
    |
EC2
    |
Nginx

## Terraform Workflow

1. Terraform Enterprise receives code from GitHub.
2. Terraform initializes the AWS provider.
3. Terraform creates a plan.
4. Plan is reviewed.
5. Terraform applies the infrastructure.
6. AWS resources are created.

## Destroy

After testing, destroy the infrastructure from Terraform Enterprise.