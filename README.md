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

************************************************************************************************************************************************************************************

Required Tools

    1. Git
    2. Terraform CLI
    3. AWS CLI
    4. Editor (VS Code or any other)


GitHub Account

    1. Create a new GitHub account and create a new blank repository.
    2. Clone that repository into your system.
    3. If you don't need to create a blank repository on GitHub, then you can directly push the source code from your machine to GitHub using CLI.
    4. Generate a Classic Token to authenticate GitHub account. (Only require if your repo is Private)


Terraform Enterprise

    1. Go to app.terraform.io and create a new account if you don't have. If you have account then login into your account.
    2. Create new Organizations for Personal use.
    3. Create new Workspace using Version Control Workflow (VCS).
    4. Authenticate your GitHub account and attach your repository.


AWS IAM Role creation for Authentication on Terraform Enterprise web portal

    1. Login to your AWS console.
    2. Go to IAM service.
    3. Go to user which you need to assign roles.
    4. Click on "Identity Providers"
    5. Click on "Add provider"
        A. Provider type --> OpenID Connect
        B. Provider URL --> Domain name / URL of your Terraform Enterprise
        C. Audience --> aws.workload.identity
        D. Click on "Add Provider" to create new provider
    6. Once the provider is created, then you need to assign IAM role to that provider
        A. Click on Assign Role from the same window where you created Provider or else go to "Roles" and click on "Create Role" to add new role.
        B. Trusted entity type --> Web identity
        C. Identity provider --> app.terraform.io (in my case). You can select whatever provider name you have created
        D. Audience --> aws.workload.identity (in my case). You can select whatever provider name you have created
        E. Workload type --> "Workspace Run"
        F. Organization --> Give name of your Organization which you have created in Terraform enterprise web portal
        G. Project Name --> Give name of your Project name which you have created in Terraform enterprise web portal
        H. Workspace Name --> Give name of your Workspace name name which you have created in Terraform enterprise web portal
        I. Run Phase --> plan and apply
    7. Click on Next to add permission to that specific IAM role
    8. Review the configuration and click on Create role to create IAM role


AWS Authentication on Terraform Enterprise web portal

    1. Add required variables like - Terraform Variables and Environment Variables. If any sensitive credentials are stored, then check the "Sensitive" check box and then create the variable.

        A. AWS_PROVIDER_AUTH for AWS Account Authentication
        B. AWS_RUN_ROLE_ARN --> Assigned IAM Roles for "Terraform Plan" and "Terraform Apply" command so whenever any new push done on any specific branch then it will automatically trigger "Terraform Plan" from TFE portal and then ask for approval to execute "Terraform Apply" command.


Project directory and Terraform configuration files

    1. Setup your source code in a directory.
    2. Create Terraform files according to the requirement and store it on the same location/directory where your source code had setup.


Commands

    1. terraform login --> To login into terraform enterprise using CLI and after login you need to generate a token from terraform enterprise web portal, copy that token and paste it into CLI where it is asking to enter token to authenticate terraform enterprise account on CLI
    2. terraform init --> Initialize terraform locally and creates .terraform and .terraform.lock.hcl file
    3. terraform validate --> Checks either configurations are valid or not
    4. git init --> If you haven't clone any repo in your system
    5. git add . --> Adds everything into git locally
    6. git commit -m "SOME MSG" --> Creates a commit with msg to track the records
    7. git push origin BRANCH_NAME --> Push directory content from your machine to GitHub Repository

Once you done with your push, then Terraform Enterprise will automatically start executing "Terraform Plan" and show you the plan of which resources are going to create by terraform, which resources are updating or removing or any other stuffs which is done by terraform.

Once plan is completed, then it will ask you to add comments and after your approval, it will start executing "Terraform Apply" commands to create a desired architecture on the Cloud.
