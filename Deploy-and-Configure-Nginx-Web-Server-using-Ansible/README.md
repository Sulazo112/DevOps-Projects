# Deploy and Configure Nginx Web Server using Ansible

### Introduction

Nginx is a powerful and widely used web server known for its performance and flexibility. Deploying and configuring Nginx manually on multiple servers can be time-consuming, but with Ansible, this process becomes automated and efficient. This project will teach us how to use Ansible to deploy and configure an Nginx web server on a Linux machine.

#### Objectives

1. Understand how Ansible simplifies the deployment and configuration of applications.
2. Set up an Ansible environment for managing Linux servers.
3. Create and execute an Ansible playbook to install Nginx.
4. Configure a basic Nginx website using Ansible. Verify the Nginx deployment.

#### Prerequisites

1. Linux Servers: At least one server to act as the target machine and an optional control machine for Ansible.
2. Ansible Installed: Ansible installed on the control machine. (Refer to the Ansible installation guide if needed.)
3. SSH Access: SSH access between the control machine and target servers with public key authentication.
4. Tools: A text editor to create and edit Ansible playbooks.

#### Tasks Outline

1. Install and configure Ansible on the control machine.
2. Set up an inventory file for the target Linux server.
3. Create an Ansible playbook to install Nginx. Configure a custom Nginx website using Ansible.
4. Verify the Nginx deployment and access the website.

### Project Tasks

#### Task 1 - Install and Configure Ansible

1. Install Ansible on the control machine (Ubuntu example):
On this project, I will be using Ubuntu created on AWS and login to the ubuntu Linux server.

![Ansible Controller](./img/)

Login to the ubuntu server and update.

1. Update the package repository

sudo apt update

![Sudo apt update](./img/Sudo%20apt%20update.png)

2. Install Ansible:

sudo apt install ansible -y

![Sudo apt install ansible](./img/Install%20Ansible.png)

3. Verify the installation:

ansible --version

The output should display the installed Ansible version like this:

![Ansible version](./img/Ansible%20version.png)

4. Set up SSH key-based authentication between the control machine and target server:

Follow the steps below to generate keygen on the controller machine, copy the key to the Node server and access the Node server from the controller machine as below:

Login to access the controller server on AWS

cd ~/.ssh

 ls

ssh-keygen # this will generate the public id and private id

cat id_ed25519.pub #This would show the public id

Copy the public ID to the server you wanted to manage

5. Test SSH access without a password:

ssh ubuntu@44.210.219.83

![Cd ssh](./img/Cd%20ssh.png)

![CD SSH2](./img/CD%20SSH%202.png)

![SSH access without password top](./img/SSh%20access%20without%20password%20top.png)

![SSH access without password bottom](./img/SSH%20access%20without%20password%20bottom.png)

We have now successfully configured a passwordless SSH access.

#### Task 2 - Set Up the Ansible Inventory File

1. Create a directory for Ansible configuration:

mkdir ~/ansible cd ~/ansible

![Mkdir Ansible](./img/Mk%20dir%20ansible.png)

2. Create an inventory file:

vim inventory.ini

![Touch inventory.ini](./img/Touch%20inventory.ini.png)

3. Add target machine details to the inventory:

[web_servers] target ansible_host=44.210.219.83 ansible_user=ubuntu

![Cat inventory.ini](./img/Cat%20inventory.ini.png)

4. Save and close the file.

#### Task 3 - Create an Ansible Playbook to Install Nginx

1. Create a playbook file for installing Nginx:

vim install_nginx.yml

![Touch Install nginx.yml](./img/Touch%20install-nginx.ini.png)

2. Add the following playbook content:

![Nginx file](./img/Nginx%20file.png)

![Vi install nginx.yml](./img/Vi%20nginx.yml.png)

![Cat install nginx.yml](./img/Cat%20install-nginx.yml.png)

3. Save the file.

#### Task 4 - Configure a Custom Nginx Website Using Ansible


1. Create a playbook for Nginx website configuration:

vim configure_nginx.yml

2. Add the following playbook content:

![Configure nginx file](./img/Configure%20nginx%20file.png)

![Vi configure nginx.yml top](./img/Vi%20configure%20nginx.yml%20top.png)

![Vi configure nginx.yml middle](./img/Vi%20configure%20ngix.yml%20middle.png)

![Configure nginx.yml bottom](./img/Vi%20configure%20nginx.yml%20bottom.png)

#### Task 5 - Verify the Nginx Deployment

1. Run the playbooks to install and configure Nginx:

ansible-playbook -i inventory.ini install_nginx.yml

![Run playbook to install nginx.yml](./img/Run%20playbook%20to%20install%20nginx.yml.png)

ansible-playbook -i inventory.ini configure_nginx.yml

![Run the playbook to configure nginx.yml](./img/Run%20the%20playbook%20to%20configure%20nginx.yml%20top.png)

![Run the playbook to configure nginx.yml bottom](./img/Run%20the%20playbook%20to%20configure%20nginx,yml%20bottom.png)

2. Verify Nginx is running on the target server:

Edit securiy group in AWS to allow inbound rulles to application access.

![Verify nginx is running on a target server](./img/Verify%20nginx%20is%20running%20on%20the%20target%20server.png)

curl http://<target-server-ip>

curl http://34.229.162.205

![Curi http target server](./img/Curl%20http%20target%20server.png)

3. Open the target server's IP address in a web browser to access the custom website.

![Hello from nginx](./img/Hello%20from%20nginx.png)

#### Conclusion

In this project, we used Ansible to automate the deployment and configuration of the Nginx web server on a Linux machine. we created reusable playbooks for installing Nginx and deploying a custom website. With these skills, we can manage multiple web servers efficiently, customize configurations further, and scale your deployment processes.

END.



