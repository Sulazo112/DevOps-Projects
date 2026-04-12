# E-Commerce with GitHub Actions

## Capstone Project: E-Commerce Application CI/CD Pipeline

### Project Overview: Automated Pipeline for an E-Commerce Platform

#### Hypothetical Use Case:

You are tasked with developing and maintaining an e-commerce platform. This platform has two primary components:

E-Commerce API: Backend service handling product listings, user accounts, and order processing.

E-Commerce Frontend: A web application for users to browse products, manage their accounts, and place orders.

The goal is to automate the integration and deployment process for both components using GitHub Actions, ensuring continuous delivery and integration.

### Project Tasks:

#### Task 1: Project Setup

Create a new GitHub repository named ecommerce-platform.

1. ##### Create the GitHub repository

On GitHub:

. Click New Repository

. Name it ecommerce-platform

. Choose Public or Private

. (Optional) Add a README and a Node .gitignore

![Ecommerce-Platform](./img/Ecommerce-Platform%20Repo.png)

2. ##### Clone the repository to your machine

![Clone the repo](./img/Clone%20the%20repo%20.png)

git clone https://github.com/<your-username>/ecommerce-platform.git
cd ecommerce-platform

![Cd Ecommerce Platform](./img/Cd%20ecommerce%20Platform.png)

Inside the repository, create two directories: api for the backend and webapp for the frontend.

3. ##### Create the required directories

mkdir api-backend

mkdir webapp-backend

![Dir api and Webapp](./img/Dir%20Api%20and%20Webapp.png)

4. ##### Commit the initial structure

git add .
git commit -m "Initial project setup with api and webapp directories"
git push origin main

![Commit the initial structure](./img/Commit%20the%20initial%20structure.png)

#### Task 2: Initialize GitHub Actions

Initialize a Git repository and add your initial project structure.

1. Move into your project folder:

cd ecommerce-platform

2. Initialize Git (if not already initialized):

git init

3. Add the backend and frontend directories created in Task 1:

mkdir -p api webapp

4. Add a placeholder file so Git tracks the empty folders:

echo "# API service" > api/README.md
echo "# Webapp service" > webapp/README.md

![Add a placeholder file](./img/Add%20a%20placeholder%20file.png)

5. Stage and commit the initial structure:

git add .
git commit -m "Initial project structure with api and webapp directories"

6. Connect to the GitHub repository (if not already connected):

git remote add origin https://github.com/<your-username>/ecommerce-platform.git
git branch -M main
git push -u origin main

![Connect to Github repo](./img/Connect%20to%20Github%20repo.png)

##### Create .github/workflows directory in your repository for GitHub Actions.

1. Create the directory:

mkdir -p .github/workflows

2. Add a placeholder file so Git tracks the folder:

echo "# GitHub Actions workflows will be added here" > .github/workflows/README.md

3. Commit the workflow directory:

git add .
git commit -m "Add GitHub Actions workflows directory"
git push

![Workflow directory](./img/Workflow%20directory.png)


#### Task 3: Backend API Setup

In the api directory, set up a simple Node.js/Express application that handles basic e-commerce operations.

Implement unit tests for your API.

##### Creating the Node.js/Express API

1. Initialize the backend project
Inside the api directory:

cd api
npm init -y
npm install express
npm install --save-dev jest supertest

![Cd api backend top](./img/Cd%20api%20backend%20top.png)

![Cd api backend bottom](./img/Cd%20api%20backend%20bottom.png)

2. Create the backend folder structure
Inside api-backend/, create the required directories:

mkdir -p src/routes tests

![Api Folders](./img/Api%20folders.png)

3. Add the backend application code
src/app.js

![Vi app.js](./img/Vi%20app.js.png)

![App.js file script](./img/App.js%20file%20script.png)

4. src/server.js

![Vi server.js](./img/Vi%20server.js.png)

![Server.js file script](./img/Server.js%20file%20script.png)

5. Add simple route handlers
src/routes/products.js

![Vi Products.js](./img/Vi%20Products.js.png)

![src routes Products.js file script](./img/Src%20routes%20product.js%20file%20script.png)

6. src/routes/users.js

![Vi users.js](./img/Vi%20users.js.png)

![Src routes users.js file script](./img/Src%20routes%20users.js%20file%20script.png)

7. src/routes/orders.js

![Vi orders.js](./img/Vi%20orders.js.png)

![Src routes orders.js file script](./img/Src%20routes%20orders.js%20file%20script.png)

8. Add unit tests
tests/products.test.js

![Cat Products.test.js](./img/Cat%20Products.test.js.png)

![Vi products.test.js](./img/Vi%20products.test.js.png)

9. tests/users.test.js

![Vi users.test.js](./img/Vi%20users.test.js.png)

![Tests users.test.js file script](./img/Tests%20users.test.js%20file%20script.png)

10. tests/orders.test.js

![Vi orders.test.js](./img/Vi%20orders.test.js.png)

![Test orders.test.js file script](./img/Tests%20orders.test.js%20file%20script.png)

11. ##### Update your package.json test script

Open package.json and replace the test script:

![Vi Package.json](./img/Vi%20Package.json%20.png)

![Package.json file script](./img/Vi%20Package.js%20file%20script.png)

12. ##### Run and verify

Run tests:

npm test

![Run test top](./img/Run%20test%20top.png)

![Run test bottom](./img/Run%20test%20bottom.png)

#### Task 4: Frontend Web Application Setup

In the webapp directory, create a simple React application that interacts with the backend API.

Ensure the frontend has basic features like product listing, user login, and order placement.

1. ##### Creating the React application

Move into your frontend directory:

cd webapp-frontend

Create a Vite React project:

npm create vite@latest . --template react
npm install

![Create the react application](./img/Create%20the%20react%20application.png)

![Create the react application bottom](./img/Creaste%20the%20react%20applicxation%20bottom.png)

![Localhost 5173](./img/Localhost%205173.png)

2. ##### Connecting the frontend to the backend API
The backend runs on port 3000, so create a simple API helper.

Create src/api.js

![Vi webappfronend api.js](./img/Vi%20webappfrontend%20api.js.png)

This file centralizes all API calls so your components stay clean.

3. ##### Create the Product List component
Create:

src/components/ProductList.jsx

![Vi ProductList.jsx](./img/Vi%20ProductList.jsx.png)

![ProductList.jsx file script](./img/Productlist,jsx%20file%20script.png)

4. ##### Create the Login component
Create:

src/components/Login.jsx

![Vi login.jsx](./img/Vi%20Login.jsx.png)

![Login.jsx file script top](./img/Login.jsx%20file%20script%20top.png)

![Login.jsx file script bottom](./img/Login.jsx%20file%20script%20bottom.png)

5. ##### Create the Order Form component
Create:

src/components/OrderForm.jsx

![Vi OrderForm.jsx](./img/Vi%20OrderForm.jsx%20.png)

![OrderForm.jsx file script top](./img/OrderForm.jsx%20file%20script%20top.png)

![OrderForm.jsx file script bottom](./img/OrderForm.jsx%20file%20script%20bottom.png)

6. ##### Combine everything in App.jsx
Open:

src/App.jsx
Replace its content with:

![App.jsx file script replaced](./img/App.jsx%20file%20script%20replaced.png)

![Vi App.jsx](./img/Vi%20App.jsx%20replaced.png)

7. ##### Run the frontend
Start your backend:

npm start

Then start your frontend:

npm run dev

Open:

http://localhost:5173

![Run the frontend](./img/Run%20the%20frontend.png)

![E-commerce Frontend Localhost](./img/Ecommerce-Frontend%20localhost.png)

#### Task 5: Continuous Integration Workflow

Write a GitHub Actions workflow for the backend and frontend that:
Installs dependencies.

Runs tests.

Builds the application.

1. ##### Create the .github/workflows directory
Run these commands from project root:

mkdir -p .github/workflows

You can verify it was created:

ls .github

You should see:

workflows

![Github workflow directory](./img/Github%20workflow%20directory.png)

2. ##### Create the backend workflow file
Create the backend CI workflow:

nano/vi .github/workflows/api-ci.yml

![Vi Api-ci.yml](./img/Vi%20Api-ci.yml.png)

![Api-ci.yml file script top](./img/Api-ci.yml%20file%20script%20top.png)

![Api-ci.yml file script bottom](./img/Api-ci.yml%20file%20script%20bottom.png)

3. ##### Create the frontend workflow file
Create the frontend CI workflow:

nano/vi .github/workflows/webapp-ci.yml

Paste this:

![Webapp-ci.yml file script top](./img/Webapp-ci.yml%20file%20script%20top.png)

![Webapp-ci.yml file script bottom](./img/Webapp-ci.yml%20file%20script%20bottom.png)

![Vi Webapp-ci.yml](./img/Vi%20webapp-ci.yml.png)

4. ##### Commit and push your workflows
Run:

git add .github/workflows
git commit -m "Add CI workflows for backend and frontend"
git push

![Commit and push workflow](./img/Commit%20and%20push%20workflow.png)

![Commit and push workflow bottom](./img/Commit%20and%20push%20workflow%20bottom.png)

Then go to:

👉 GitHub → Your Repository → Actions

You’ll see both workflows appear and run automatically.

![Workflow autorun](./img/workflow%20autorun.png)

#### Task 6: Docker Integration

Create Dockerfiles for both the backend and frontend.

Modify your GitHub Actions workflows to build Docker images.

##### Step 1 — Create Dockerfile for the Backend
Navigate to:

ecommerce-platform/api-backend/

Create a file named:

Dockerfile

Paste this inside:

[Dockerfile](./img/Dockerfile.png)

![Touch Dockerfile](./img/Touch%20Dockerfile.png)

##### Step 2 — Create Dockerfile for the Frontend
Navigate to:

ecommerce-platform/webapp-frontend/

Create:

Dockerfile

Paste this:

![Webapp-Frontend dockerfile script](./img/Webapp-frontend%20Dockerfile%20script.png)

![Vi Webapp-Frontend Dockerfile](./img/Vi%20webapp-frontend%20Dockerfile.png)

##### Step 3 — Add .dockerignore files
This keeps your images clean and small.

Backend .dockerignore

#### step 4 - Navigate to the backend folder:

cd ecommerce-platform/api-backend

Create the .dockerignore file:

nano/vi .dockerignore

Paste this inside:

![Api-backend Docker.ignore file script](./img/Api-backend%20.dockerignore%20file%20script.png)

![Vi Docker.ignore file script](./img/Vi%20Docker%20.ignore%20file%20script.png)

##### Create the frontend .dockerignore
1. Navigate to the frontend folder:

cd ecommerce-platform/webapp-frontend

2. Create the .dockerignore file:

nano/vi .dockerignore

3. Paste this inside:

![Webapp-Frontend.dockerignore file script](./img/Webapp-Frontend.dockerignore%20file%20script.png)

![Vi Webapp-Frontend.dockerignore](./img/Vi%20Webapp-Frontend.dockerignore.png)

##### Step 4 — Build & Run Your Backend Docker Image
1. Move into your backend folder:

cd /ecommerce-platform/api-backend

2. Build the Docker image:

docker build -t ecommerce-backend .

3. Run the backend container:

docker run -p 5000:5000 ecommerce-backend

![Api backend docker image top](./img/Api-backend%20docker%20image.png)

![Api-Backend docker image bottom](./img/Api-backend%20docker%20image%20bottom.png)

![Run the backend container](./img/Run%20the%20backend%20container.png)

Now open your browser and visit:

http://localhost:5000

If your backend prints logs or responds to requests, it’s working beautifully.

![Localhost 5000](./img/Localhost%205000.png)

##### Run the Frontend Docker Container
Now move into your frontend folder:

cd ecommerce-platform/webapp-frontend

1. Build the frontend image

docker build -t ecommerce-frontend .

2. Run the frontend container

docker run -p 80:80 ecommerce-frontend

Then open your browser and visit:

http://localhost

You should see your frontend UI loading from inside Docker.

![Build the frontend image top](./img/Build%20the%20frontend%20image%20top.png)

![Build the frontend image bottom](./img/Build%20the%20frontend%20image%20bottom.png)

![Docker run frontend](./img/Docker%20run%20frontend.png)

![Localhost E-commerce frontend](./img/Localhost%20E-commerce.png)

#### Task 7: Deploy to Cloud

Choose a cloud platform for deployment (AWS, Azure, or GCP).

Configure GitHub Actions to deploy the Docker images to the chosen cloud platform.

Use GitHub Secrets to securely store and access cloud credentials.

Since i am already on AWS, I will be building deployment pipeline around Amazon ECS (Fargate) and Amazon ECR, which is the most production‑ready way to deploy Docker containers on AWS.

##### STEP 1 — Create AWS Credentials for GitHub Actions

1. Go to AWS Console → IAM
2. Create a new user:
Name: github-actions-deployer
3. Assign permissions:
Attach this policy:

AmazonEC2ContainerRegistryFullAccess
AmazonECS_FullAccess

![IAM user](./img/IAM%20User.png)

![Attached Policies](./img/Attached%20policies.png)

![New User](./img/New%20users.png)

4. Create access keys
Copy:

AWS_ACCESS_KEY_ID

AWS_SECRET_ACCESS_KEY

![Retrieve Access key](./img/Retrieve%20accesskey.png)

##### STEP 2 — Add GitHub Secrets
Go to:

GitHub → Your Repo → Settings → Secrets → Actions

Add these secrets:

![Secret credentials](./img/Secret%20credentials.png)

These secrets allow GitHub Actions to authenticate with AWS.

##### STEP 3 — Create ECR Repositories
In AWS Console → ECR → Create Repository:

ecommerce-backend

ecommerce-frontend

These will store your Docker images.

![ECR](./img/ECR%20.png)

![Create ECR repo](./img/Create%20ECR%20repo.png)

![ECR Frontend repo](./img/ECR%20Frontend%20repo.png)

![ECR Repositories](./img/ECR%20Repositories.png)

These will store the Docker images.

##### STEP 4 — Update GitHub Actions to Build & Push Docker Images to ECR
You will add these steps to your existing CI workflows.

cd .github/workflows

![Open backend workflow](./img/Open%20backend%20workflow.png)

![Steps to ci workflow](./img/Steps%20to%20ci%20workflow.png)

##### Update the Frontend Workflow (webapp-ci.yml)
Just like we did for the backend, we will edit the frontend workflow located at:

ecommerce-platform/.github/workflows/webapp-ci.yml

Navigate to the file:

cd workflows

vi webapp-ci.yml

![Updated Webapp-ci.yml](./img/Updated%20webapp-ci.yml.png)

##### Create ECS Cluster
Go to AWS Console → ECS

Click Create Cluster

Choose Networking only (Fargate)

Name it:
ecommerce-cluster

Create

![ECS](./img/ECS.png)

![Create cluster](./img/Create%20cluster.png)

##### Create Task Definitions
You need two task definitions:

1️⃣ Backend Task Definition
Name: ecommerce-backend-task

Launch type: Fargate

Container:

Image: <AWS_ACCOUNT_ID>.dkr.ecr.<AWS_REGION>.amazonaws.com/ecommerce-backend:latest

Port: 5000

Memory: 512 MiB

CPU: 256

![Task definition](./img/Task%20definition.png)

![Backend task definition](./img/Backend%20Task%20definition.png)

2️⃣ Frontend Task Definition
Name: ecommerce-frontend-task

Launch type: Fargate

Container:

Image: <AWS_ACCOUNT_ID>.dkr.ecr.<AWS_REGION>.amazonaws.com/ecommerce-frontend:latest

<AWS_ACCOUNT_ID>.dkr.ecr.<AWS_REGION>.amazonaws.com/ecommerce-frontend:latest
Port: 80

Memory: 512 MiB

CPU: 256

![Frontend task definition](./img/Frontend%20task%20definition.png)

##### Create Your ECS Services
We will create two services, one for the backend and one for the frontend.
Both will run inside ECS cluster using the task definitions we just created.

Backend Service (API)
1. Go to:
ECS → Clusters → ecommerce-cluster

2. Click:
Create → Create service

3. Configure the service:
Launch type: Fargate

Task definition:  
ecommerce-backend-task:1 (or latest revision)

Service name:  
ecommerce-backend-service

Desired tasks:  
1

4. Networking:
VPC: choose your default VPC

Subnets: select all available

Auto-assign public IP: ENABLED

Security group:  
Create or choose one that allows inbound traffic on port 5000

5. Load balancer:
You can skip this for now (optional).

6. Click Create service
Your backend will now deploy.

![Ecommerce cluster services create](./img/Ecommerce%20cluster%20service.png)

![Networking services](./img/Networking%20services.png)

![Service Backend](./img/Service%20Backend.png)

##### Frontend Service (Web App)
Repeat the same steps:

1. ECS → ecommerce-cluster → Create service
2. Service settings:
Task definition:  
ecommerce-frontend-task:1

Service name:  
ecommerce-frontend-service

Desired tasks:  
1

3. Networking:
Public IP: ENABLED

Security group:  
Allow inbound traffic on port 80

4. Create service
Your frontend will now deploy

![Triggerd Frontend workflow](./img/Triggerd%20Frontend%20workflow.png)

![Triggered backend workflow](./img/Triggerd%20backend%20workflow.png)

### Task 8: Continuous Deployment

Configure your workflows to deploy updates automatically to the cloud environment when changes are pushed to the main branch.

#### Continuous Deployment (CD) with AWS App Runner

App Runner automatically redeploys service every time GitHub Actions workflow pushes a new image to ECR.
That means the CI pipeline is already doing 80% of the work — we just need to connect the final piece.

##### Step 1: CI pipeline is already correct

GitHub Actions workflow:

Builds the backend image

Tags it

Pushes it to ECR

Runs automatically on every push to main as CD requires. So there is no need to modify workflow anymore.

##### Step 2: Create an App Runner service connected to your ECR repo

Go to AWS Console → App Runner

Click Create service.

Choose:

##### Deployment source:

Container registry

Provider: Amazon ECR

Repository: backend-api

Tag: latest

##### Deployment settings:

Automatic deployment: ON  

##### Service settings:

CPU: 1 vCPU

Memory: 2 GB

Port: 3000 (or whatever your backend uses)

##### Security:

Create or use an existing IAM role

App Runner will automatically pull from ECR

Click Create & Deploy.

App Runner will:

Pull your image

Start your backend

Give you a public HTTPS URL

Automatically redeploy on every new image push

This is full Continuous Deployment.

##### STEP 1 — Create an ECS Cluster
Go to:

AWS Console → ECS → Create Cluster

Choose:

Cluster template: Networking only (Fargate)

Cluster name: backend-cluster

Click Create.

![Backend cluster](./img/Backend%20cluster.png)

##### STEP 2 — Create a Task Definition
Go to:

ECS → Task Definitions → Create new Task Definition

Choose:

Launch type: Fargate

Task family: backend-task

CPU: 0.5 vCPU

Memory: 1 GB

Add Container:

Container name: backend

Image:

<your-account-id>.dkr.ecr.<region>.amazonaws.com/backend-api:latest

Port mappings:

Container port: 3000

Environment variables (if needed)
Add your backend config here.

Click Create.

![Task definition successfully](./img/Task%20definition%20successfully.png)

![Backend task](./img/Backend%20task.png)

##### STEP 3 — Create a Fargate Service
Go to:

ECS → Clusters → backend-cluster → Create Service

Choose:

Launch type: Fargate

Task definition: backend-task

Service name: backend-service

Desired tasks: 1

Networking:
VPC: default

Subnets: select all

Security group:

Allow inbound 3000 (or your backend port)

Allow outbound 0.0.0.0/0

Load Balancer (optional but recommended)
If you want HTTPS + domain later:

Choose Application Load Balancer

Create new target group

Map port 3000

Click Create Service.

Your backend is now running on ECS Fargate.

![Fargate service](./img/Fargate%20service.png)

##### STEP 4 — Connect CI/CD to ECS (Automatic Deployment)
GitHub Actions workflow already pushes images to ECR.
We now add one final step to update the ECS service automatically.

Add this to the end of workflow:

![Update workflow](./img/Update%20workflow.png)

This step:

Updates the task definition with the new image

Triggers ECS to redeploy

Waits until the service is stable

![ECS task definition](./img/ECS%20task%20definition.png)

![ECS service running container](./img/ECS%20service%20running%20container.png)

### Conclusion

This capstone project aims to provide hands-on experience in automating CI/CD pipelines for a real-world e-commerce application, encompassing aspects like backend API management, frontend web development, Docker containerization, and cloud deployment.

End.