# Introduction to Jenkins

## Introduction To CICD

Continuous Integration and Continuous Delivery (CI/CD) is a set of best practices and methodologies that revolutionize the software development lifecycle by enhancing efficiency, reliability, and speed. CI/CD represents a seamless integration of automation and collaboration throughout the development process, aiming to deliver high-quality software consistently and rapidly. In the realm of CI, developers regularly integrate their code changes into a shared repository, triggering automated builds and tests to detect integration issues early. On the other hand, CD encompasses both Continuous Delivery and Continuous Deployment, ensuring that software is always in a deployable state and automating the deployment process for swift and reliable releases. The CI/CD pipeline fosters a culture of continuous improvement, allowing development teams to iterate quickly, reduce manual interventions, and deliver software with confidence.

## What is Jenkins

Jenkins is widely employed as a crucial CI/CD tool for automating software development processes. Teams utilize Jenkins to automate building, testing, and deploying applications, streamlining the development lifecycle. With Jenkins pipelines, developers can define, version, and execute entire workflows as code, ensuring consistent and reproducible builds. Integration with version control systems allows Jenkins to trigger builds automatically upon code changes, facilitating early detection of issues and enabling teams to deliver high-quality software at a faster pace. Jenkins' flexibility, extensibility through plugins, and support for various tools make it a preferred choice for organizations aiming to implement efficient and automated DevOps practices.

### Project Goals

#### By the end of this project, learners should have;

Developed a foundational understanding of Continuous Integration (CI) and Continuous Delivery (CD) principles, and articulate their role in improving software development processes.

Acquired proficiency in using Jenkins by mastering installation, configuration, and navigation through the Jenkins user interface, and gain hands-on experience in creating and managing Jenkins jobs.

Learned the end-to-end process of automating software builds, running automated tests, and deploying applications using Jenkins, fostering a practical understanding of CI/CD pipelines. -Apply best practices in CI/CD processes, including parameterized builds, integration with external tools, and leveraging containerization technologies like Docker.

### Project Highlight

Introduction To CICD
What is Jenkins
Project Pre-requisites
Project Gaols
Getting Started With Jenkins
Jenkins Job
Creating a Freestyle Project
Connecting Jenkins To Our Source Code Management
Configuring Build Trigger
Creating a Pipeline Job
Configuring Build Trigger
Writing Jenkins Pipeline Script
Installing Docker
Building Pipeline Script

### Getting Started With Jenkins

Now that we have an idea what jenkins, let's dive in to installing jenkins, laucnh ubuntu Ec2 server on AWS and name it Jenkins, connect to the server.

![Ubuntu EC2 server](./img/Ubuntu%20EC2%20server.png)

![Server connected](./img/Server%20connected.png)

### Update package repositories

sudo apt update

![Sudo apt update](./img/Sudo%20apt%20update.png)

### Install JDK

sudo apt install default-jdk-headless

![Install Jdk-headless](./img/Install%20Jdk-headless.png)

### Install Jenkins

![Code to Install Jenkins](./img/Code%20to%20Install%20Jenkins.png)

wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add - sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > \ /etc/apt/sources.list.d/jenkins.list' sudo apt update sudo apt-get install jenkins

![Install Jenkins](./img/Install%20Jenkins.png)

The command installs Jenkins. It involves importing the Jenkins GPG key for package verification, adding the Jenkins repository to the system's sources, updating package lists, and finally, installing Jenkins through the package manager (apt-get).

### Check if jenkins has been installed, and it is up and running

![Status Jenkins](./img/Status%20Jenkins.png)

### On our Jenkins instance, create new inbound rules for port 8080 in security group

By default, jenkins listens on port 8080, we need to create an inbound rule for this in the security group of our jenkins instance

![Edit inbound rules](./img/Edit%20Inbound%20rules.png)

### Set up Jenkins On The Web Console

i. Input your Jenkins Instance ip address on your web browser i.e. http://public_ip_address:8080

![Unlock Jenkins](./img/Unlock%20jenkins.png)

ii. On your Jenkins instance, check "/var/lib/jenkins/secrets/initialAdminPassword" to know your password.

sudo cat /var/lib/jenkins/secrets/initialAdminPassword

![Admin Password](./img/Admin%20Password.png)

iii. Installed suggested plugins

![Install suggested pluggins](./img/Install%20suggested%20pluggins.png)

iv. Create a user account

![Create admin username](./img/Create%20admin%20user%20name.png)

![Instance configuration](./img/Instance%20configuration.png)

![Jenkins is ready](./img/Jenkins%20is%20ready.png)

v. Log in to jenkins console

![Welcome to Jenkins](./img/Welcome%20to%20Jenkins.png)

### Creating a Freestyle Project

Let's create our first build job

i. From the dashboard menu on the left side, click on new item

![New item](./img/New%20item.png)

ii. Create a freestyle project and name it "my-first-job"

![My first job](./img/My%20first%20job.png)

### Connecting Jenkins To Our Source Code Management

Now that we have created a freestyle project, let connect jenkins with github.

i. Create a new github repository called jenkins-scm with a README.md file

![New Github repo](./img/New%20Github%20repo.png)

ii. Connect jenkins to jenkins-scm repository by pasting the repository url in the area selected below. Make sure your current branch is main

![Connect Jenkins](./img/Connect%20Jenkins%20.png)

![Configure General](./img/Configure%20General.png)

![Configuration repo](./img/Configuration%20repo.png)

![Configuration Main](./img/Configuration%20Main.png)

iii. Save configuration and run "build now" to connect jenkins to our repository

![Build now](./img/Build%20now.png)

Projcet Build

![Builds](./img/Builds.png)

End.