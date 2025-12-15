# Introduction to Continuous Integration and Continuous Delivery/Deployment

## Introduction to Continuous Integration and Continuous Deployment

The project will involve setting up a simple web application (e.g., a Node.js application) and applying CI/CD practices using GitHub Actions. This application will have basic functionality, such as serving a static web page.

### Introduction to GitHub Actions and CI/CD Course Project

Welcome to our course on GitHub Actions and Continuous Integration/Continuous Deployment (CI/CD). This course is designed to provide a hands-on learning experience, guiding you through the essentials of automating software development processes using GitHub Actions. Whether you're a developer, a student, or just curious about CI/CD practices, this course will equip you with the practical skills and knowledge you need to implement these powerful automation techniques in your projects.

### Why is This Relevant for Learners?

![Chef analogy](./img/Chef-analogy.png)

Imagine you're a chef in a busy restaurant. Every dish you prepare is like a piece of software code. Without a systematic approach, you might end up with orders being mixed up, dishes taking too long to prepare, or worse, the quality of the food being inconsistent. This is where a well-organized kitchen, with clear processes and automation (like having appliances that precisely time and cook parts of the dishes), comes into play. In software development, CI/CD is akin to this efficient kitchen. It ensures that your 'dishes' (software builds) are consistently 'cooked' (built, tested, and deployed) with precision and efficiency. By learning GitHub Actions and CI/CD, you're essentially learning how to set up and manage your high-tech kitchen in the software world, allowing you to serve 'dishes' faster, with higher quality, and with fewer 'kitchen mishaps' (bugs and deployment issues).

This course will help you understand and implement these practices, making your software development process more efficient and error-free, much like a well-orchestrated kitchen. Whether you're working on personal projects, contributing to open source, or building enterprise-level applications, mastering CI/CD with GitHub Actions will be an invaluable skill in your development toolkit.

### Pre-requisites

1. Basic Knowledge of Git and GitHub:

Understanding of version control concepts.
Familiarity with basic Git operations like clone, commit, push, and pull.

A GitHub account and knowledge of repository management on GitHub.

2. Understanding of Basic Programming Concepts:
Fundamental programming knowledge, preferably in JavaScript, as the example project uses Node.js.

Basic understanding of how web applications work.

3. Familiarity with Node.js and npm:
Basic knowledge of Node.js and npm (Node Package Manager).

Ability to set up a simple Node.js project and install dependencies using npm.

4. Text Editor or IDE:

A text editor or Integrated Development Environment (IDE) like Visual Studio Code, Atom, Sublime Text, or any preferred editor for writing and editing code.

5. Local Development Environment:
Node.js and npm installed on the local machine.
Access to the command line or terminal.

6. Internet Connection:

Stable internet connection to access GitHub and potentially other online resources or documentation.

7. Basic Understanding of CI/CD Concepts (Optional but Helpful):

General awareness of Continuous Integration and Continuous Deployment concepts.

This can be part of the learning in the course, but prior knowledge is beneficial.

### Lesson 1: Understanding Continuous Integration and Continuous Deployment

#### Objectives:

1. Define CI/CD and understand its benefits.
2. Get familiar with the CI/CD pipeline.

### Lesson Details:

Definition and Benefits of CI/CD:
Continuous Integration (CI) is the practice of merging all developers' working copies to a shared mainline several times a day.

Continuous Deployment (CD) is the process of releasing software changes to production automatically and reliably.

Benefits: Faster release rate, improved developer productivity, better code quality, and enhanced customer satisfaction.

Overview of the CI/CD Pipeline:
CI Pipeline typically includes steps like version controls, code integration, automated testing, and building the application.

CD Pipeline involves steps like deploying the application to a staging or production environment, and post-deployment monitoring.

Tools: Version control systems (e.g., Git), CI/CD platforms (e.g., GitHub Actions), testing frameworks, and deployment tools.

### Lesson 2: Introduction to GitHub Actions

#### Objectives:

1. Understand what GitHub Actions is.
2. Learn key concepts and terminology.

### Lesson Details:

GitHub Actions: A CI/CD platform integrated into GitHub, automating the build, test, and deployment pipelines of your software directly within your GitHub repository.

Documentation Reference: Explore the GitHub Actions Documentation for in-depth understanding. https://docs.github.com/en/actions

#### Key Concepts and Terminology:

1. Workflow:

Definition: A configurable automated process made up of one or more jobs. Workflows are defined by a YAML file in your repository.

Example: A workflow to test and deploy a Node.js application upon a Git push.

Documentation: Learn more about workflows in the GitHub Docs on Workflows.https://docs.github.com/en/actions/how-tos/write-workflows

2. Event:

Definition: A specific activity that triggers a workflow. Events include activities like push, pull request, issue creation, or even a scheduled time.

Example: A push event triggers a workflow that runs tests every time code is pushed to any branch in a repository.

Documentation: Review different types of events in the Events that trigger workflows section.https://docs.github.com/en/actions/reference/workflows-and-actions/events-that-trigger-workflows

3. Job:
Definition: A set of steps in a workflow that are executed on the same runner. Jobs can run sequentially or in parallel.

Example: A job that runs tests on your application.

Documentation: Understand jobs in detail in the GitHub Docs on Jobs.https://docs.github.com/en/actions/how-tos/write-workflows/choose-what-workflows-do

4. Step:
Definition: An individual task that can run commands within a job. Steps can run scripts or actions.

Example: A step in a job to install dependencies (npm install).

Documentation: Learn about steps in the Steps section of GitHub Docs. https://docs.github.com/en/actions/reference/workflows-and-actions/workflow-syntax#jobsjob_idsteps

5. Action:

Definition: Standalone commands combined into steps to create a job. Actions can be written by you or provided by the GitHub community.

Example: Using actions/checkout to check out your repository code.

Documentation: Explore GitHub Actions in the Marketplace https://github.com/marketplace?type=actions and learn how to create your own in the Creating actions guide. https://docs.github.com/en/actions/how-tos/reuse-automations

6. Runner:

Definition: A server that runs our workflows when they're triggered. Runners can be hosted by GitHub or self-hosted.

Example: A GitHub-hosted runner that uses Ubuntu.

Documentation: Delve into runners in the GitHub Docs on Runners.https://docs.github.com/en/actions/how-tos/manage-runners/github-hosted-runners

#### Additional Resources:

GitHub Learning Lab: Interactive courses to learn GitHub Actions. Visit GitHub Learning Lab. https://lab.github.com/courses

GitHub Actions Quickstart: For a hands-on introduction, check out the Quickstart for GitHub Actions.https://docs.github.com/en/actions/get-started/quickstart

Community Forums: Engage with the GitHub community for questions and discussions at GitHub Community Forums.https://github.com/orgs/community/discussions/

### Practical Implementation

#### Setting Up the Project:

1. Initialize a GitHub Repository:

Create a new repository on GitHub.

Go to github.com

Click New Repository

Enter a name (e.g., nodejs-ci-demo)

Choose Public

Do NOT check "Add README" — we will push from local

Click Create Repository

![Create a new repository](./img/Create%20new%20repository.png)

Clone it to your local machine.

Open gitbash and and cd to the workfolder and clone the repository to the directory you want.

git clone https://github.com/Sulazo112/-nodejs-ci-demo.git

![git clone](./img/git%20clone.png)

The repository is empty, reason for the warning.

Cd to the node-ci-demo folder

![Cd nodejs-ci-demo](./img/Cd%20nodejs-ci-demo.png)

2. Create a Simple Node.js Application:

Initialize a Node.js project (npm init).

npm init -y

![npm init y](./img/npm%20init%20y.png)

This creates a package.json.

If encouter error below follow the steps to resolve the issue:

![If encounter error](./img/If%20error%20encounter.png)

Resolve the issue following the below:

### If You Are Using Windows

Step 1 — Download Node.js

Go to:🔗 https://nodejs.org

Download the LTS version and install it (Next → Next → Finish).

Step 2 — Verify Installation

Open Command Prompt or PowerShell and run:

node -v npm -v

### If You Are Using Ubuntu / Debian Linux

Run:

sudo apt update sudo apt install nodejs npm -y

#### (Optional but recommended) Install latest Node.js:

sudo apt install curl -y curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash - sudo apt install -y nodejs

Verify:

node -v npm -v

### If You Are Using macOS

Using Homebrew:

brew install node

Verify:

node -v npm -v

Create a simple server using Express.js to serve a static web page.

npm install express

![npm install express](./img/npm%20install%20express.png)

Add your code to the repository and push it to GitHub.

![inex.js](./img/index.js1.png)

#### Add a start script to package.json

In package.json, under "scripts":

![Package.json](./img/Package.json%20script.png)

![Git add](./img/Git%20add.png)

![Git commit initial node.js](./img/Git%20commit%20initial%20node.js.png)

![Git push origin main](./img/Git%20push%20origin%20main.png)

![run app](./img/run%20app.png)

![Test local host](./img/test%20local%20host.png)

3. Writing Your First GitHub Action Workflow:

GitHub Actions runs automation like testing, building, and deployment.

Create a .github/workflows directory in your repository.

mkdir -p .github/workflows

![Mkdir](./img/Mkdir%20.png)

Add a workflow file (e.g., node.js.yml).

.github/workflows/node.js.yml

![touch github work flow](./img/touch%20github%20workflow.png)

![Node.js CI script](./img/Node.js%20CI%20script.png)

![Node.js CI script bottom](./img/Node.js%20cI%20script%20bottom.png)

### Explanation:

name: This simply names your workflow. It's what appears on GitHub when the workflow is running.

on: This section defines when the workflow is triggered. Here, it's set to activate on push and pull request events to the main branch.

jobs: Jobs are a set of steps that execute on the same runner. In this example, there's one job named build.

runs-on: Defines the type of machine to run the job on. Here, it's using the latest Ubuntu virtual machine.

strategy.matrix: This allows you to run the job on multiple versions of Node.js, ensuring compatibility.

steps: A sequence of tasks executed as part of the job.

actions/checkout@v2: Checks out your repository under $GITHUB_WORKSPACE.

actions/setup-node@v1: Sets up the Node.js environment.

npm ci: Installs dependencies defined in package-lock.json.

npm run build --if-present: Runs the build script from package.json if it's present.

npm test: Runs tests specified in package.json.

This workflow is a basic example for a Node.js project, demonstrating how to automate testing across different Node.js versions and ensuring that your code integrates and works as expected in a clean environment.

4. Testing and Deployment:

Add automated tests for your application.
Testing the CI Pipeline

To test:

- Make a simple change to index.js

- Commit and push:

- git add .

- git commit -m "Testing CI pipeline"

- git push

![Commit and push wrokflow](./img/Commit%20and%20push%20workflow.png)

![Testing CI pipeline](./img/Testing%20CI%20pipeline.png)

Go to:

GitHub → Your repo → Actions tab

![Workflow run](./img/Workflow%20run.png)

Create a workflow for deployment (e.g., to a cloud service like Heroku or AWS).

#### Prerequisites (You MUST do these first)

1 An EC2 instance running Linux (Ubuntu recommended)

![Github action workflow ec2 instance](./img/Github%20action%20workflow%20EC2.png)

Ensure you can SSH into it manually.

![SSh connection](./img/SSH%20connection.png)

2. Install Node.js and PM2 on your EC2 server

SSH into EC2 and run the command below:

sudo apt update

![EC2 sudo apt update](./img/EC2%20sudo%20apt%20update.png)

sudo apt install -y nodejs npm

![Install nodejs npm](./img/Install%20nodejs%20npm.png)

Copy your EC2 private key (PEM) into GitHub Secrets

GitHub → Repo → Settings → Secrets and variables → Actions → New repository secret

![Github secret](./img/Github%20secret.png)

![EC2 SSh key](./img/EC2%20SSH%20key.png)

![Add secret key](./img/Add%20Secret%20Key.png)

4. Ensure your EC2 has Git installed

sudo apt install git -y

![Install git](./img/Install%20git.png)

### Create the Deployment Workflow

#### Create a new workflow:

.github/workflows/deploy.yml

Cd to this directory to add locally

![New workflow directory](./img/New%20workflow%20directory.png)

![Cd to the directory](./img/Cd%20to%20the%20directory%20.png)

Create file using touch and add the code below:

![Yaml code](./img/Yaml%20code.png)

![Yaml file code top](./img/Yaml%20file%20code%20top.png)

![Yaml file code bottom](./img/Yaml%20file%20code%20bottom.png)

![Git push workflow](./img/Git%20push%20workflow.png)

![Github Deploy workflow](./img/Deploy%20workflow.png)

Git Action Successfully deply to Ec2 Instance.

![Deployed to ec2 work flow runs](./img/deployed%20to%20ec2%20workflow%20runs.png)

#### How the Workflow Works

1. Trigger
Runs automatically every time you push to the main branch.

2. Uses your EC2 private key
GitHub downloads your private key at runtime (from secrets).

3. SSH into EC2
Secure connection → no password needed.

4. Pulls latest code
Your app updates instantly: git pull origin main

5. Installs dependencies npm install

6. Restarts Node.js with PM2
PM2 keeps your app running forever:pm2 restart all
If it's the first deployment: pm2 start index.js --name nodeapp

### Our CI/CD Pipeline Is Now Complete

✔ Push code →

✔ GitHub Actions tests it (CI) →

✔ If successful → Deploys automatically to EC2 (CD)

This is a real industry-standard Node.js → AWS EC2 pipeline.

5. Experiment and Learn:

Modify workflows to see how changes affect the CI/CD process. Completed.

Try adding different types of tests (unit tests, integration tests). Completed.

Project End.






