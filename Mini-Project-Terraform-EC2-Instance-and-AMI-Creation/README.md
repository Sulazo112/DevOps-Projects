# Mini Project - Terraform EC2 Instance and AMI Creation

In this mini project, we will use Terraform to automate the creation of an EC2 instance on AWS and then create an Amazon Machine Image (AMI) from that instance.

### Objectives

Learn how to write basic Terraform configuration files.

Learn how to write Terraform script to automate creation of an EC2 instance on AWS.

Learn how to use Terraform script to automate the creation of an AMI from an already created EC2 instance on AWS.

### Prerequisites

This project requires you to have an AWS Account and the AWS CLI configured to it locally. This setup will be used by the Terraform script you are going to write. From your local command line interface, Terraform will use the configured AWS CLI credential to communicate with your AWS Account when executing the script.

Ensure you have an AWS Account created and functional. You may see a guide here to create a new AWS account.https://docs.aws.amazon.com/accounts/latest/reference/manage-acct-creating.html
Ensure you have the AWS CLI installed and configured with the credentials of your AWS Account. You may see a guide here. https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
Ensure you have Terraform installed on your computer. You may see a guide

### Tasks Outline

1. Confirm the Prerequisites
2. Write the Script
3. Execute the Script
i. Initialize [init]
ii. Validate [validate]
iii. Plan [plan]
iv. Apply [apply]
4. Confirm Resources
5. Clean up
i. Destroy [destroy]

### Project Tasks

#### Task 1 - Confirm the Prerequisites

1. Login into your AWS Account to confirm it is functional.

![AWS console home](./img/AWS%20console%20home.png)

2. Run aws --version on your terminal to confirm the AWS CLI is installed. You should see an output similar to this.

![AWS version](./img/AWS%20version.png)

3. Run aws configure list to confirm the AWS CLI is configured. You should see an output similar to this.

![AWS configure list](./img/AWS%20configure%20list.png)

4. Run aws sts get-caller-identity to verify that the AWS CLI can successfully authenticate to your AWS Account. You should see an output similar to this.

![AWs get caller identity](./img/AWS%20get%20caller%20identity.png)

5. Run terraform --version to confirm Terraform is installed. You should see an output similar to this.

![Terraform version](./img/Terraform%20version.png)

#### Task 2 - Developing the Terraform Script to create EC2 Instance and AMI from it

1. Create a new directory for this Terraform project: mkdir terraform-ec2-ami and cd terraform-ec2-ami.

![Ls terraform ec2 ami](./img/Ls%20terraform%20ec2%20ami.png)

![Cd terraform ec2 ami](./img/Cd%20Terraform%20ec2%20ami.png)

2. Inside this directory, create a Terraform configuration file: touch main.tf

![Touch main.tf](./img/Touch%20main.tf.png)

3. Inside this file, write the script to create an EC2 instance specifying instance type, ami, and tags. Extend this script to include the creation of an AMI from the created EC2 Instance. (See sample below)

![Terraform script](./img/Terraform%20script.png)

Formalized Script:

![Formalized Terraform script](./img/Formalized%20Terraform%20Script.png)

![Developed main.tf top](./img/Developed%20main.tf%20top.png)

![Developed main.tf Middle](./img/Developed%20main.tf%20middle.png)

![Developed main.tf](./img/Developed%20main.tf%20bottom.png)

#### Script Explanation

This script creates an EC2 instance and then creates an AMI from that instance.

1. Provider Block:

provider "aws" tells Terraform to use AWS as the cloud provider
region = "us-east-1" specifies which AWS region to use

2. EC2 Instance Creation

resource "aws_instance" "my_ec2_spec" creates an EC2 Instance
ami = ami-0ecb62995f68bb549" specifies the Amazon Machine Image ID to use for the instance
instance_type = "t2.micro" defines the EC2 Instance type
The tag block adds a name tag to the instance for identification
3. AMI Creation from the EC2 Instance

resource "aws_ami" "my_ec2_spec_ami" creates an AMI from the EC2 Instance
name = "my-ec2-ami" names the new AMI
source_instance_id = aws_instance.my_ec2_spec.id uses the EC2 Instance to create the AMI

#### Task 3 - Executing the Terraform Script

1. Initialize the Terraform project using terraform init

![Terraform init](./img/Terraform%20init.png)

2. Validate the correctness of this script using terraform validate

![Terraform validate](./img/Terraform%20validate.png)

3. Confirm the resources that will be created by the execution of this script using terraform plan

![Terraform plan](./img/Terraform%20plan.png)

4. Apply the Terraform configuration using terraform apply

![Terraform apply top](./img/Terraform%20apply%20top.png)

![Terraform apply bottom](./img/Terraform%20apply%20bottom.png)

#### Task 4 - Confirm Resources

Confirm the creation of the EC2 Instance and its AMI in your AWS Account according to the specified details.

![EC2 and AMI](./img/EC2%20and%20AMI%20terraform%20.png)

#### Task 5 - Clean up

Execute command terraform destroy to clean up the resources created by the script.

![Terraform destroy top](./img/Terraform%20destroy%20top.png)

![Terraform destroy bottom](./img/Terraform%20destroy%20bottom.png)

END.

