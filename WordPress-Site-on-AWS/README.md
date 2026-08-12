# WordPress Site on AWS

## Capstone Project: WordPress Site on AWS

### Project Scenario

A small to medium-sized digital marketing agency, "DigitalBoost", wants to enhance its online presence by creating a high-performance WordPress-based website for their clients. The agency needs a scalable, secure, and cost-effective solution that can handle increasing traffic and seamlessly integrate with their existing infrastructure. Your task as an AWS Solutions Architect is to design and implement a WordPress solution using various AWS services, such as Networking, Compute, Object Storage, and Databases.

### Pre-requisite

Knowledge of TechOps Essentials

Completion of Core 2 Courses and Mini Projects

The project overview with necessary architecture have been provided as you help DigitalBoost with her Wordpress-Based Website. Kindly follow the instructions below to complete this Capstone Project. Also, necessary scripts have been provided here

![Install WordPress script](./img/Install%20WordPress%20script.png)

![SSL WordPress Script](./img/SSL%20wordPress%20script.png)

![Udserdata ALB script](./img/Userdata%20ALB%20script.png)

### Project Deliverables

#### Documentation:

Detailed documentation for each component setup.

Explanation of security measures implemented.

#### Demonstration:

Live demonstration of the WordPress site.

Showcase auto-scaling by simulating increased traffic.

## Project Overview

![Project Overview](./img/Project%20Overview.png)

This project designs and implements a scalable, secure, and cost‑effective WordPress hosting platform on Amazon Web Services (AWS) for a digital marketing agency, DigitalBoost. The goal is to provide a multi‑AZ, highly available web application stack that can handle increasing client traffic while maintaining strong security controls and predictable costs.

The solution is built on a custom Virtual Private Cloud (VPC) spanning two Availability Zones. Public subnets host internet‑facing components such as the Application Load Balancer (ALB) and NAT Gateways, while private subnets host the web server Auto Scaling Group, shared storage using Amazon EFS, and a highly available Amazon RDS MySQL database. Security Groups and IAM are used to strictly control traffic flows and access to resources.

Automation scripts are used to bootstrap the web tier, install and configure WordPress, mount shared storage, and correctly handle SSL termination behind the ALB. This architecture enables DigitalBoost to onboard multiple client sites, scale with demand, and integrate with additional AWS services in the future.

## Project Components

### 1. VPC Setup

### VPC ARCHITECTURE

![VPC Architecture](./img/VPC%20Architecture.png)

Objective: Create a Virtual Private Cloud (VPC) to isolate and secure the WordPress infrastructure.

Steps:

Define IP address range for the VPC.
Create VPC with public and private subnets.
Configure route tables for each subnet.

### Create the VPC (10.0.0.0/16)

![Create The VPC 10.0.0.0/16](./img/Create%20the%20VPC.png)

## 2. Public and Private Subnet with NAT Gateway

### NAT GATEWAY ARCHITECTURE

![NAT Gateway Architecture](./img/NAT%20Gateway%20Architecture.png)

Objective: Implement a secure network architecture with public and private subnets. Use a NAT Gateway for private subnet internet access.

Steps:

Set up public subnet for resources accessible from the internet.
Create private subnet for resources with no direct internet access.
Configure a NAT Gateway for private subnet internet access.

### Create Subnets (Public + Private Across 2 AZs)

The architecture uses 6 subnets:

2 public

2 private app

2 private data

This matches AWS best practices for WordPress HA deployments.

#### Public Subnet AZ1

![Public Subnet AZ1](./img/Public%20Subnet%20AZ1.png)

#### Public Subnet AZ2

![Public Subnet AZ2](./img/Public%20Subnet%20AZ2.png)

#### Private App Subnet AZ1

![Private App Subnet AZ1](./img/Private%20App%20Subnet%20AZ1%20.png)

#### Private App Subnet AZ2

![Private App subnet AZ2](./img/Private%20App%20Subnet%20AZ2.png)

#### Private Data Subnet AZ1

![Private Data subnet AZ1](./img/Private%20Data%20Subnet%20AZ1.png)

#### Private Data Subnet AZ2

![Private Data Subnet AZ2](./img/Private%20Data%20Subnet%20AZ2.png)

### Create Route Tables and Associate Subnets

We need:

1 Public Route Table

2 Private Route Tables (one per AZ)

#### Public Route Table

![Public Route Table](./img/Public%20Route%20Table.png)

#### Associate with public subnets:

![Associate with Public Subnet1](./img/Associate%20with%20Public%20subnet1.png)

#### Private Route Table AZ1

![Private Route Table AZ1](./img/Private%20Route%20Table%20AZ1.png)

#### Associate:

![Associate with Private subnet1](./img/Associate%20with%20Private%20subnet1.png)

#### Private Route Table AZ2

![Private Route Table AZ2](./img/Private%20Route%20Table%20AZ2.png)

#### Associate with Private subnet2:

![Associate with Private Subnet2](./img/Associate%20with%20Private%20subnet2.png)

### Verify Everything

![Verifying Output Table top](./img/Verifying%20Output%20table%20top.png)

![Verifying Output table1](./img/Verifying%20Output%20table%20top1.png)

![Verifying Output Table bottom](./img/Verifying%20Output%20table%20bottom.png)

![Verifying Output table bottom2](./img/Verifying%20Output%20table%20bottom2.png)

![Verifying all Route table top](./img/Verifying%20All%20route%20table%20top.png)

![Verifying all Route table bottom](./img/Verifying%20All%20route%20table%20bottom.png)

### Create and Attach the Internet Gateway (IGW)

This gives the public subnets access to the internet.

#### Create IGW

![Internet Gateway](./img/Internet%20Gateway.png)

#### Attach IGW to the VPC

![Attach IGW to VPC](./img/Attach%20IGW%20to%20VPC.png)

### Create NAT Gateway (for Private Subnet Internet Access)

#### Allocate an Elastic IP (EIP) for the NAT Gateway

This EIP will be attached to the NAT Gateway so it can reach the internet.

![Allocate EIP for the NAT Gateway](./img/Allocate%20EIP%20for%20the%20NAT%20Gateway.png)

#### Create the NAT Gateway in the Public Subnet (AZ1)

This NAT Gateway will serve all private subnets.

![NAT Gateway in the public subnet AZ1](./img/NAT%20Gateway%20in%20Public%20subnetAZ1.png)

#### Add NAT Route to the Private Route Table (AZ1)

This gives the private subnets outbound internet access (updates, package installs, WordPress plugins, etc.)

![Add NAT Route to the Private Route table AZ1](./img/Add%20NAT%20Route%20to%20the%20Private%20Route%20table%20AZ1.png)

## 3. AWS MySQL RDS Setup

### SECURITY GROUP ARCHITECTURE

![Security Group Architecture](./img/Security%20Group%20Architecture.png)

Objective: Deploy a managed MySQL database using Amazon RDS for WordPress data storage.

Steps:

Create an Amazon RDS instance with MySQL engine.
Configure security groups for RDS instance.
Connect WordPress to the RDS database.

### STEP 1 — Create the Security Groups

#### Create ALB Security Group

![ALB Security Group](./img/ALB%20Security%20Group.png)

Allow HTTP from anywhere:

![Allow HTTP from anywhere](./img/Allow%20HTTP%20from%20anywhrere.png)

#### Create EC2 Security Group

![EC2 Security Group](./img/EC2%20Security%20Group.png)

Allow ALB → EC2:

![Allow ALB EC2](./img/Allow%20ALB%20EC2.png)

Allow SSH from IP (optional)

![Allow SSH from IP](./img/Allow%20SSH%20from%20IP.png)

#### Create RDS Security Group

![RDS Security Group](./img/RDS%20Security%20Group.png)

Allow EC2 → RDS:

![Allow EC2 RDS](./img/Allow%20EC2%20RDS.png)

### STEP 2 — Create the RDS MySQL Instance

This will deploy RDS into the private data subnets.

#### Create DB Subnet Group

![DB Subnet Group](./img/DB%20Subnet%20Group.png)

#### Create RDS MySQL Instance

![Create RDS MySQL Instance](./img/Create%20RDS%20MySQL%20Instance%20.png)

Check creation status:

![Check creation status](./img/Check%20creation%20status.png)

![Check creation status1](./img/Check%20creation%20status1.png)

This creates:

A private MySQL database

Accessible only from EC2

Not exposed to the internet

Perfect for WordPress

#### Connect WordPress to RDS

Once RDS is created, get the endpoint

![RDS Endpoint](./img/RDS%20Endpoint.png)

### 4. EFS Setup for WordPress Files

Objective: Utilize Amazon Elastic File System (EFS) to store WordPress files for scalable and shared access.

Steps:

Create an EFS file system.
Mount the EFS file system on WordPress instances.
Configure WordPress to use the shared file system.

#### 1. Create EFS Security Group (SG‑EFS)

EFS must only allow NFS traffic (port 2049) from EC2 instances.

![EFS Security Group](./img/EFS%20Security%20Group.png)

Allow EC2 → EFS:

![EFS Ingress Rule](./img/EFS%20Ingress%20rule.png)

#### Create the EFS File System

![Create EFS](./img/Create%20EFS%20File%20system.png)

#### Create EFS Mount Target in Private-Data-AZ1

![EFS Mount Target AZ1](./img/EFS%20Mount%20target%20AZ1.png)

#### Create EFS Mount Target in Private-Data-AZ2

![EFS Mount Target AZ2](./img/EFS%20Mount%20target%20AZ2.png)

This ensures EC2 instances in both AZs can mount EFS.

### 5. Application Load Balancer

Objective: Set up an Application Load Balancer to distribute incoming traffic among multiple instances, ensuring high availability and fault tolerance.

Steps:

Create an Application Load Balancer.
Configure listener rules for routing traffic to instances.
Integrate Load Balancer with Auto Scaling group.

#### Create the Target Group

![Create Target Group](./img/Create%20Target%20Group.png)

#### Create the Application Load Balancer (ALB)

![Create ALB](./img/Create%20ALB.png)

#### Create the ALB Listener (Port 80 → Target Group)

![Create ALB Listener](./img/Create%20the%20ALB%20Listener.png)

### Create the UserData Script (WordPress + EFS + RDS)

This script will:

Install Apache, PHP, and required modules

Download WordPress

Mount EFS to /var/www/html

Configure wp-config.php with your RDS endpoint

Start Apache

#### Step 1 — Create a userdata.sh file

![Touch Userdata.sh](./img/Touch%20Userdata.sh.png)

![Vi Userdata.sh top](./img/Vi%20Userdata.sh%20top.png)

![Vi Userdata.sh bottom](./img/Vi%20Userdata.sh%20bottom.png)

#### Step 2 — Base64‑encode the UserData

Git Bash requires this: USERDATA=$(base64 -w 0 userdata.sh)

Check it: echo $USERDATA

![Base64-Encode the Userdata](./img/Base64-Encode%20the%20Userdata.png)

#### Step 3 — Create the Launch Template

![Create the Launch Template](./img/Create%20The%20Launch%20Template.png)

##### What to do when encounter AMI launch Template Error/Fix

###### Create a new Launch Template version

![Fix Launch template error1](./img/Fix%20error%20Launch%20template%201.png)

![Fix Error Launch template2](./img/Fix%20error%20Launch%20template%202.png)

###### Set the new version as the default

First, list versions:

![List version](./img/List%20version%20.png)

Now set version 2 as default:

![Set version 2 as default](./img/Set%20vertion%202%20as%20default.png)

### 6. Auto Scaling Group

Objective: Implement Auto Scaling to automatically adjust the number of instances based on traffic load.

Steps:

Create an Auto Scaling group.
Define scaling policies based on metrics like CPU utilization.
Configure launch configurations for instances.

#### Step 1 — Create the Auto Scaling Group

![Create and verify Auto Scaling Group](./img/Create%20and%20Verify%20Auto%20scaling%20group.png)

##### Verify the instance is launching

Check the ASG activity:

![Verify the instance is launching](./img/Create%20and%20Verify%20Auto%20scaling%20group.png)

##### Verify Target Group registration

![Verifying Target group registration1](./img/Verifying%20Target%20group%20registration1.png)



