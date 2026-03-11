# Terraform Capstone Project Automated WordPress Deployment on AWS

## Automated WordPress deployment on AWS

### Project Scenario

DigitalBoost, a digital marketing agency, aims to elevate its online presence by launching a high-performance WordPress website for their clients. As an AWS Solutions Architect, your task is to design and implement a scalable, secure, and cost-effective WordPress solution using various AWS services. Automation through Terraform will be key to achieving a streamlined and reproducible deployment process.

### Pre-requisite

. Knowledge of TechOps Essentials
. Completion of Core 2 Courses and Mini Projects

The project overview, necessary architecture, and scripts have been provided to help DigitalBoost with their WordPress-based website. Follow the instructions below to complete this Terraform Capstone Project.

### Project Deliverables

#### Documentation:

. Detailed documentation for each component setup.
. Explanation of security measures implemented.

#### Demonstration:

. Live demonstration of the WordPress site.
. Showcase auto-scaling by simulating increased traffic.

#### Project Overview

![Set up overview](./img/Setup%20Overview.jpg)

### Project Components

1. #### VPC Setup

VPC ARCHITECTURE

![Vpc Architecture](./img/Vpc%20Architecture.jpg)

. Objective: Create a Virtual Private Cloud (VPC) to isolate and secure the WordPress infrastructure.

Steps:

. Define IP address range for the VPC.
. Create VPC with public and private subnets.
. Configure route tables for each subnet.

#### Instructions for Terraform:

. Use Terraform to define VPC, subnets, and route tables.
. Leverage variables for customization.
. Document Terraform commands for execution.

2. #### Public and Private Subnet with NAT Gateway

NAT GATEWAY ARCHITECTURE

![Nat gateway](./img/NAT%20gateway.jpg)

. Objective: Implement a secure network architecture with public and private subnets. Use a NAT Gateway for private subnet internet access.

Steps:

. Set up a public subnet for resources accessible from the internet.
. Create a private subnet for resources with no direct internet access.
. Configure a NAT Gateway for private subnet internet access.

#### Instructions for Terraform:

. Utilize Terraform to define subnets, security groups, and NAT Gateway.
. Ensure proper association of resources with corresponding subnets.
. Document Terraform commands for execution.

3. #### AWS MySQL RDS Setup

SECURITY GROUP ARCHITECTURE

![Security group](./img/Security%20group%20Database.jpg)

. Objective: Deploy a managed MySQL database using Amazon RDS for WordPress data storage.

Steps:

. Create an Amazon RDS instance with the MySQL engine.
. Configure security groups for the RDS instance.
. Connect WordPress to the RDS database.

#### Instructions for Terraform:

. Define Terraform scripts for RDS instance creation.
. Configure security groups and define necessary.parameters.
. Document Terraform commands for execution.

4. #### EFS Setup for WordPress Files

. Objective: Utilize Amazon Elastic File System (EFS) to store WordPress files for scalable and shared access.

Steps

. Create an EFS file system.
. Mount the EFS file system on WordPress instances.
. Configure WordPress to use the shared file system.

#### Instructions for Terraform:

. Develop Terraform scripts to create EFS file system.
. Define configurations for mounting EFS on WordPress .instances.
. Document Terraform commands for execution.

5. #### Application Load Balancer

. Objective: Set up an Application Load Balancer to distribute incoming traffic among multiple instances, ensuring high availability and fault tolerance.

Steps:

. Create an Application Load Balancer.
. Configure listener rules for routing traffic to instances.
. Integrate Load Balancer with Auto Scaling group.

6. #### Auto Scaling Group

. Objective: Implement Auto Scaling to automatically adjust the number of instances based on traffic load.

Steps:

. Create an Auto Scaling group.
. Define scaling policies based on metrics like CPU utilization.
. Configure launch configurations for instances.

#### Instructions for Terraform:

. Develop Terraform scripts for Auto Scaling group creation.
. Define scaling policies and launch configurations.
. Document Terraform commands for execution.

Note: Provide thorough documentation for each Terraform script and include necessary variable configurations. Encourage students to perform a live demonstration of the WordPress site, showcasing auto-scaling capabilities by simulating increased traffic. The documentation should explain the security measures implemented at each step.

#### Solution

Below is a complete, step-by-step Terraform solution to deploy a scalable, secure, cost-aware WordPress stack on AWS using VPC + Public/Private Subnets + NAT + ALB + Auto Scaling + RDS (MySQL) + EFS. I will included:

. A clean Terraform folder structure
. Re-usable modules for each component
. Fully working Terraform code snippets
. Security best practices at every step
. Demo steps for a live test + auto-scaling simulation
. Cost control tips and operational guidance

✅ Assumptions (safe defaults):

. AWS Region: configurable via var.region (default: us-east-1)
. Terraform >= 1.5, AWS provider >= 5.X
. You have an AWS account with IAM permissions
. You’ll use AWS Systems Manager (SSM) instead of SSH for instance access (no open SSH ports)
. WordPress connects to RDS using the private network; app servers do not have public IPs
. EFS stores wp-content uploads to be shared across autoscaled instances

1. #### Repository & Module Layout

![Repo and module layout](./img/Repo%20and%20Module%20layout.png)

2. #### Security Model (applies across the stack)

Network isolation:

. Public subnets: ALB, NAT Gateway only.
. Private subnets: EC2 (WordPress) & RDS & EFS Mount Targets.
. No public IPs on EC2/RDS. Outbound internet via NAT only.

#### Least privilege security groups:

. ALB: inbound :80 (and optionally :443) from the internet.
. ASG/EC2: inbound :80 only from ALB SG; SSM access via VPC endpoints (or AWS-managed).
. RDS: inbound :3306 only from EC2 SG.
. EFS: inbound :2049 only from EC2 SG.

#### Secrets & credentials:

. DB password stored in AWS SSM Parameter Store (SecureString) or AWS Secrets Manager.
. Never hardcode creds in Terraform state; use references.

#### TLS (recommended for prod):

Add ACM certificate + ALB HTTPS listener (443) + redirect from 80 → 443.

IAM & access:

Attach AmazonSSMManagedInstanceCore to EC2 instances.

No inbound SSH from internet.

High availability:

Subnets spread across 2+ AZs.

ALB + multi-AZ RDS, EFS multi-AZ mount targets.

Cost awareness:

One NAT Gateway per AZ is best practice; for labs, you may start with one NAT gateway to reduce cost.

Use t3/t4g instance families and db.t3.micro for sandbox.

Backups:

Enable automated backups on RDS, EFS Lifecycle (IA transitions) if needed.

3. #### Root-Level Terraform Files

Create Terraform WordPress Directory and cd to the directory to create file structure

mkdir terraform-wordpress

![Mkdir terraform wordpress](./img/Mkdir%20terraform%20wordpress.png)

touch versions.tf

![Vi version.tf](./img/Vi%20version.tf.png)

![Version.tf](./img/Version.tf%20.png)

![Cat version.tf](./img/Cat%20versions.tf.png)

touch provider.tf

![Touch provider.tf](./img/Touch%20provider.tf.png)

![Provider.tf](./img/Provider.tf.png)

Touch variables.tf

![Touch variables.tf](./img/Touch%20variables.tf.png)

![Variables.tf top](./img/Variables.tf%20top.png)

![Variables.tf middle](./img/Variables.tf%20middle.png)

![Variables.tf midlde2](./img/Variables.tf%20middle2.png)

![Variables.tf middle3](./img/Variables.middle3.png)

![Variables.tf bottom](./img/Variables%20bottom.png)

touch outputs.tf

![Touch outputs.tf](./img/Touch%20output.tf.png)

![Outputs.tf](./img/Output.tf.png)

![Cat outputs.tf](./img/Cat%20outputs.tf.png)

touch main.tf

![Touch main.tf](./img/Touch%20main.tf.png)

![Main.tf top](./img/Main.tf%20top.png)

![Main.tf bottom](./img/Main.tf%20bottom.png)

4. #### Module: VPC

modules/vpc/variables.tf

Create directory and create variables.tf file and cd to vpc

![Mkdir modules](./img/Mkdir%20module.png)

![Vi vpc variables.tf](./img/Vi%20%20Vpc%20Variables.png)

![Vpv Variables.tf top](./img/Vpc%20Variables.tf%20top.png)

![Vpc Variables.tf bottom](./img/Vpc%20Variables.tf%20bottom.png)

modules/vpc/main.tf

![Vpc touch main.tf](./img/Vpc%20Touch%20main.tf.png)

![Vpc main.tf top](./img/Vpc%20main.tf%20top.png)

![Vpc main.tf middle](./img/Vpc%20main.tf%20middle.png)

![Vpc main.tf bottom](./img/Vpc%20main.tf%20bottom.png)

modules/vpc/outputs.tf

![Vpc touch outputs.tf](./img/Vpc%20touch%20outputs.tf.png)

![Vpc outputs.tf](./img/Vpc%20outputs.tf%20top.png)

5. #### Module: NAT Gateway

modules/nat/variables.tf

![Mkdir nat](./img/Mkdir%20nat.png)

![Nat touch variables.tf](./img/Nat%20touch%20variables.tf.png)

![Nat variables.tf](./img/Nat%20variables.tf.png)

![Nat cat variables.tf](./img/Nat%20cat%20variables.tf.png)

modules/nat/main.tf

![Nat touch main.tf](./img/Nat%20touch%20main.tf.png)

![Nat main.tf top](./img/Nat%20main.tf%20top.png)

![Nat main.tf bottom](./img/Nat%20main.tf%20bottom.png)

modules/nat/outputs.tf

![Nat touch output.tf](./img/Nat%20touch%20output.tf.png)

![Nat outputs.tf](./img/Nat%20outputs.tf%20top.png)

6. #### Module: RDS (MySQL)

modules/rds/variables.tf

![Mkdir rds](./img/Mkdir%20rds.png)

![Rds car variables.tf](./img/Rds%20cat%20variables.tf.png)

![Rds variables.tf top](./img/Rds%20variables.tf%20top.png)

![Rds variables.tf bottom](./img/Rds%20variables.tf%20bottom.png)

modules/rds/main.tf

![Rds touch main.tf](./img/Rds%20touch%20main.tf.png)

![Rds main.tf](./img/Rds%20main.tf.png)

![Rds main.tf bottom](./img/Rds%20main.tf%20bottom.png)

modules/rds/outputs.tf

![Rds touch outputs.tf](./img/Rds%20touch%20outputs.tf.png)

![Rds outputs.tf](./img/Rds%20output.tf.png)

7. #### Module: EFS

modules/efs/variables.tf

![Mkdir efs](./img/Mkdir%20efs.png)

![Efs Touch variables.tf](./img/Efs%20touch%20variables.png)

![Efs variables.tf](./img/Efs%20variables.tf.png)

modules/efs/main.tf

![Efs touch main.tf](./img/Efs%20touch%20main.tf.png)

![Efs main.tf](./img/Efs%20main.tf.png)

modules/efs/outputs.tf

![Efs touch outputs.tf](./img/Efs%20touch%20outputs.tf.png)

![Efs output.tf](./img/Efs%20outputs.tf.png)

8. #### Module: ALB

modules/alb/variables.tf

![Mkdir alb](./img/Mkdir%20alb.png)

![Alb Touch variables.tf](./img/Alb%20Touch%20variables.tf.png)

![Alb variables.tf](./img/Alb%20variables.tf.png)

modules/alb/main.tf

![Alb touch main.tf](./img/Alb%20touch%20main.tf.png)

![Alb main.tf](./img/Alb%20main.tf.png)

![Alb main.tf bottom](./img/Alb%20main.tf%20bottom.png)

modules/alb/outputs.tf

![Alb Touch outputs.tf](./img/Alb%20Touch%20outputs.tf.png)

![Alb outputs.tf](./img/Alb%20outputs.tf.png)

9. #### Module: ASG (EC2 + WordPress + EFS Mount)

modules/asg/variables.tf

![Mkdir asg](./img/Mkdir%20asg.png)

![Asg Touchvariables.tf](./img/Asg%20touch%20variables.tf.png)

![Asg variables.tf top](./img/Asg%20variables.tf%20top.png)

![Asg variables.tf bottom](./img/Asg%20variables.tf%20bottom.png)

modules/asg/main.tf

![Asg Touch main.tf](./img/Asg%20touch%20main.tf.png)

![Asg main.tf top](./img/Asg%20main.tf.png)

![Asg main.tf middle](./img/Asg%20main.tf%20middle.png)

![Asg main.tf bottom](./img/Asg%20main.tf%20bottom.png)

modules/asg/outputs.tf

![Asg Touch outputs.tf](./img/Asg%20touch%20outputs.tf.png)

![Asg outputs.tf](./img/Asg%20outputs.tf.png)

10. WordPress Installation

user_data/wordpress_bootstrap.sh

![Mkdir user_data](./img/Mkdir%20User_data.png)

![Touch wordpress_bootsrap.sh](./img/Touch%20wordpress_bootstrap.sh.png)

![Wordpress_bootstrap.sh](./img/Wordpress%20bootstrap.sh%20top.png)

![Wordpress_bootstrap.sh middle](./img/Word%20press%20bootstrap.sh%20middle.png)

![Wordpress_bootsrap.sh bottom](./img/Wordpress%20bootstrap.sh%20bottom.png)

Note: I inject env vars via Launch Template to fill ${DB_HOST}, ${DB_NAME}, ${DB_USER}, ${DB_PASSWORD}, ${EFS_DNS} at boot.

11. Terraform Commands & Execution Order

Initialize

terraform init

![Terraform init top](./img/Terraform%20Init.png)

![Terraform init bottom](./img/Terraform%20init%20bottom.png)

Validate & Plan

terraform validate

![Terraform validate](./img/Terraform%20validate.png)

terraform plan

![Terraform plan](./img/Terraform%20plan.png)

![Terraform plan bottom](./img/Terraform%20plan%20bottom.png)

Apply

terraform apply

![Terraform apply top](./img/Terraform%20apply%20top.png)

![Teraform apply middle](./img/Terraform%20apply%20middle.png)

![Terraform apply middle2](./img/Terraform%20apply%20middle2.png)

![Terraform apply bottom](./img/Terraform%20apply%20bottom.png)

Outputs

terraform output

![Terraform output](./img/Terraform%20output.png)













