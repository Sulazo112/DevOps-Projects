# Mini Project: Hosting a Dynamic Web App on AWS with Terraform Module, Docker, Amazon ECR, and ECS

#### Purpose:

In this mini project, you will use Terraform to create a modular infrastructure for hosting a dynamic web application on Amazon ECS (Elastic Container Service). The project involves containerizing the web app using Docker, pushing the Docker image to Amazon ECR (Elastic Container Registry), and deploying the app on ECS.

### Objectives:

1. Terraform Module Creation:

Learn how to create Terraform modules for modular infrastructure provisioning.

2. Dockerization:

Containerize a dynamic web application using Docker.

3. Amazon ECR Configuration:

Configure Terraform to create an Amazon ECR repository for storing Docker images.

4. Amazon ECS Deployment:

Use Terraform to provision an ECS cluster and deploy the Dockerized web app.

### Project Tasks:

#### Task 1: Dockerization of Web App

1. Create a dynamic web application using a technology of your choice (e.g., Node.js, Flask, Django).

2. Write a Dockerfile to containerize the web application.

3. Test the Docker image locally to ensure the web app runs successfully within a container.

#### Task 2: Terraform Module for Amazon ECR

1. Create a new directory for your Terraform project (e.g., terraform-ecs-webapp).

2. Inside the project directory, create a directory for the Amazon ECR module (e.g., modules/ecr).

3. Write a Terraform module (modules/ecr/main.tf) to create an Amazon ECR repository for storing Docker images.

#### Task 3: Terraform Module for ECS

1. Inside the project directory, create a directory for the ECS module (e.g., modules/ecs).

2. Write a Terraform module (modules/ecs/main.tf) to provision an ECS cluster and deploy the Dockerized web app.

#### Task 4: Main Terraform Configuration

1. Create the main Terraform configuration file (main.tf) in the project directory.

2. Use the ECR and ECS modules to create the necessary infrastructure for hosting the web app.

#### Task 5: Deployment

1. Build the Docker image of your web app.

2. Push the Docker image to the Amazon ECR repository created by Terraform.

3. Run terraform init and terraform apply to deploy the ECS cluster and the web app.

4. Access the web app through the public IP or DNS of the ECS service.

### Instructions:

### Prerequisites (Do This First)

#### Install and configure the following:

1. AWS Account

![AWS Account](./img/AWS%20console.png)

2. AWS CLI aws --version
![AWS version](./img/AWS%20version.png)

3. Configure AWS credentials 

![AWS configure](./img/AWS%20configure.png)

Fill in:

Access Key, Secret Key, Region (e.g. us-east-1).

4. Docker docker --version

![Docker and Terraform version](./img/Docker%20and%20Terraform%20version.png)

5. Terraform terraform --version

![Docker and Terraform version](./img/Docker%20and%20Terraform%20version.png)

### Project Structure

Create the directory structure exactly like this:

1. Create a new directory for your Terraform project using a terminal (mkdir terraform-ecs-webapp).

![mkdir Terraform ecs](./img/mkdir%20Terraform%20ecs.png)

2. Change into the project directory (cd terraform-ecs-webapp).

![cd terraform ecs webapp](./img/cd%20terraform%20ecs%20webapp.png)

3. Create directories for the ECR and ECS modules (mkdir -p modules/ecr and mkdir -p modules/ecs).

mkdir -p app

mkdir -p modules/ecr

mkdir -p modules/ecs

![Directory for ecr and ecs](./img/Directory%20for%20ecr%20and%20ecs.png)

### Final structure:

![File Structure](./img/File%20Structure.png)

3.Write the ECR module configuration (nano modules/ecr/main.tf) to create an ECR repository.

4. Write the ECS module configuration (nano modules/ecs/main.tf) to provision an ECS cluster and deploy the Dockerized web app.

5. Create the main Terraform configuration file (nano main.tf) and use the ECR and ECS modules.

6. Build the Docker image of your web app and push it to the ECR repository.

7. Run terraform init and terraform apply to deploy the ECS cluster and the web app.

8. Access the web app through the public IP or DNS of the ECS service.

9. Document your observations and any challenges faced during the project.

#### TASK 1: Create & Dockerize a Dynamic Web App

#### Step 1.1 Create a Simple Node.js Web App Inside app/

cd app

![cd app](./img/cd%20app.png)

npm init -y

![npm init](./img/npm%20init.png)

npm install express

![npm install express](./img/Install%20express.png)

#### Create index.js file:

index.js

![Index.js](./img/Index.js.png)

Copy the bolow code inside the file

![Express.js](./img/Express.js)

![Cat index.js](./img/Cat%20index.js.png)

#### Update package.json file:

![Update Jason](./img/Update%20JASON.png)

Package.json file updated

![Package jason file updsted](./img/Package%20json%20file%20updated.png)

### Step 1.2 – Write the Dockerfile

#### Create Dockerfile inside app/:

Paste the code below:

![Docker file](./img/Docker%20file.png)

touch dockerfile

![Touch dockerfile](./img/Touch%20dockerfile.png)

#### Step 1.3 – Test Locally with Docker

docker build -t my-webapp .

![Docker build](./img/Docker%20build.png)

docker run -p 3000:3000 my-webapp

![docker run -p](./img/Docker%20run%20-p.png)

✅ Let Visit:
http://localhost:3000

![localhost 3000](./img/Localhost%203000.png)

If it works → lets proceed.

### TASK 2: Terraform Module for Amazon ECR

#### Step 2.1 – modules/ecr/variables.tf

touch variables.tf

![Variable.tf](./img/Variable.tf.png)

![code for variable](./img/Code%20for%20variable.png)

![Cat variable.tf](./img/Cat%20variables.tf.png)

#### Step 2.2 – modules/ecr/main.tf

touch main.tf

![Main.tf](./img/Main.tf.png)

![Cat main.tf](./img/Cat%20main.tf.png)

#### Step 2.3 – modules/ecr/outputs.tf

touch output.tf

![Output.tf](./img/Output.tf.png)

![Cat output.tf](./img/Cat%20output.tf.png)

### TASK 3: Terraform Module for ECS (Fargate)

#### Step 3.1 – modules/ecs/variables.tf

touch variables.tf

![Main var ecs](./img/Main%20var%20ecs.png)

![Cat var ecs.tf](./img/Cat%20var%20ecs%20.tf.png)

### Step 3.2 – modules/ecs/main.tf

touch main.tf

![ecs main.tf script top](./img/ecs%20main,tf%20script%20top.png)

![Ecs main.tf script middle](./img/ecs%20main.tf%20script%20middle.png)

![Ecs main.tf script bottom](./img/Ecs%20main.tf%20script%20bottom.png)

![Ecs cat main.tf](./img/Ecs%20cat%20main.tf.png)

### TASK 4: Main Terraform Configuration

#### Step 4.1 – providers.tf

provider.tf

![Main config for providers.tf](./img/Main%20config%20for%20providers.tf.png)

![Cat providers.tf](./img/Cat%20providers.tf.png)

### Step 4.2 – variables.tf

variables.tf

![Providers variables](./img/Providers%20variables.png)

![Cat Providers variables](./img/Cat%20Providers%20variables.png)

#### Step 4.3 – main.tf

main.tf

![Maintf](./img/Maintf.png)

![Cat maintf](./img/Cat%20maintf.png)

### TASK 5: Build & Push Docker Image to ECR

#### Step 5.1 – Login to ECR

Run this command to get you ID:

aws sts get-caller-identity --query Account --output text

![Login to ecr](./img/Login%20to%20ecr.png)

Replace the Account_ID with your ID

![aws ecr login](./img/aws%20ecr%20login.png)

### Step 5.2 – Build & Tag Image

using the below, replace ECR repo URL with your ecr repo URL:

docker build -t ecs-webapp .

docker tag ecs-webapp:latest <ECR_REPO_URL>:latest

![Build docker](./img/Build%20docker.png)

![Docker build](./img/Docker%20build.png)

#### Step 5.3 – Push Image

docker push <ECR_REPO_URL>:latest

replace the ECR repo url with your url

docker push \
  522632170257.dkr.ecr.us-east-1.amazonaws.com/my-webapp-repo:latest

Error Encounter:

❌ The ECR repository does NOT exist

The repository with name 'ecs-webapp-repo' does not exist in the registry with id '121846058619'

This confirms:

👉 Terraform did NOT create an ECR repository named: ecs-webapp-repo

👉 But you are trying to push your image to: 121846058619.dkr.ecr.us-east-1.amazonaws.com/ecs-webapp-repo

#### FIX IN 3 SIMPLE STEPS (DO EXACTLY THIS)

STEP 1 — Verify What Repository Terraform Actually Created

aws ecr describe-repositories --region us-east-1

This confirm no repository created in AWS

STEP 2 — Create the repository if it does not exist

Since the repo is missing, lets manually create it:

aws ecr create-repository \ --repository-name ecs-webapp-repo \ --region us-east-1

STEP 3 — Push your image again

docker tag my-webapp:latest 121846058619.dkr.ecr.us-east-1.amazonaws.com/ecs-webapp-repo:latest

Re‑tag:

Push: 

docker push \
  522632170257.dkr.ecr.us-east-1.amazonaws.com/ecs-webapp-repo:latest

![Docker push](./img/Docker%20push.png)

 Image is now in Amazon ECR.

 #### TASK 6: Terraform Deployment

 terraform init

 ![Terraform init](./img/Terraform%20init.png)

terraform validate

![Terraform validate](./img/Terraform%20validate.png)

terraform plan

![Terraform plan](./img/Terraform%20plan.png)

![Terraform plan bottom](./img/Terraform%20plan%20bottom.png)

terraform apply

![Terraform apply](./img/Terraform%20apply%20top.png)

![Terraform apply bottom](./img/Terraform%20apply%20bottom.png)

#### TASK 7: Access the Web App

![Access the webapp](./img/Access%20the%20webapp.png)

Application Page

![Application page](./img/Application%20page.png)

#### Common Challenges & Solutions

Challenge: ECR push fails

Solution: Check AWS login & permissions

Challenge: Task keeps stopping

Solution: Check CloudWatch logs

What I have Learned

✅ Dockerizing applications

✅ Terraform modules

✅ Amazon ECR image storage

✅ ECS + Fargate deployment

✅ Real production workflow

Run Terraform Destroy to clean the deployment:

terraform destroy

![Terraform destroy top](./img/Terraform%20destroy%20top.png)

![Terraform destroy bottom](./img/Terraform%20destroy%20bottom.png)

#### Side Note:

Ensure you have the AWS CLI installed and configured with appropriate credentials.

Modify variables and configurations in the modules based on your specific requirements.

Replace placeholder values in the main configuration file with actual values.

This is a learning exercise; use it to gain hands-on experience with Terraform, Docker, Amazon ECR, and ECS.

END.





