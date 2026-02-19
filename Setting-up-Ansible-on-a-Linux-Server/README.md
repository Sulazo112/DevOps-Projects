# Setting up Ansible on a Linux Server

### Introduction

Ansible is a powerful automation tool that simplifies the management of IT infrastructure. Setting up Ansible on a Linux server is the first step toward leveraging its capabilities. This project will guide you through installing and configuring Ansible on a Linux server, allowing you to automate tasks and manage servers effectively.

### Objectives

1. Understand what Ansible is and how it works.
2. Install and configure Ansible on a Linux control node.
3. Set up SSH key-based authentication for target nodes.
4. Create an Ansible inventory file. Verify Ansible setup by running basic commands.

### Prerequisites

1. Linux Machine: A Linux server or virtual machine to act as the control node.
2. Target Machine(s): At least one additional Linux server or virtual machine for Ansible to manage.
3. SSH Access: Access to target nodes with SSH.
4. Tools: Basic knowledge of the Linux command line and a text editor.

### Tasks Outline

1. Install Ansible on the control node.
2. Configure SSH key-based authentication.
3. Create an inventory file for target machine(s).
4. Test Ansible connectivity to target machine(s).
5. Run a simple Ansible ad-hoc command.

### Project Tasks

#### Task 1 - Install Ansible on the Control Node

On this project, I will be using Ubuntu created on AWS and login to the ubuntu Linux server.

![Ansible Controller](./img/Ansible%20Controller.png)

Login to the ubuntu server and update.

1. Update the package repository

sudo apt update

![Sudo apt update](./img/Sudo%20apt%20update.png)

2. Install Ansible:

sudo apt install ansible -y

![Install Ansible](./img/Install%20Ansible.png)

3. Verify the installation:

ansible --version

The output should display the installed Ansible version like this:

![Ansible version](./img/Ansible%20version.png)

#### Task 2 - Configure SSH Key-Based Authentication

1. Generate an SSH key pair on the control node:

ssh-keygen -t rsa

Press Enter to accept the default path and passphrase.

![SSH keygen](./img/SSH%20keygen.png)

2. Copy the public key to the target machine(s):

Follow the steps below to generate keygen on the controller machine, copy the key to the Node server and access the Node server from the controller machine as below:

Login to access the controller server on AWS

cd ~/.ssh

![CD .ssh](./img/CD%20.ssh.png)

 ls

ssh-keygen # this will generate the public id and private id

cat id_ed25519.pub #This would show the public id

Copy the public ID to the server you wanted to manage

![Cat Authorized keys](./img/Cat%20authorized%20key.png)

3. Test SSH access without a password:

ssh ubuntu@3.92.185.138

![SSH access without password](./img/SSH%20access%20without%20password.png)

We have now successfully configured a passwordless SSH access.

#### Task 3 - Create an Inventory File

1. Create a directory for Ansible configuration:

mkdir ~/ansible cd ~/ansible

![Mk dir Ansible](./img/Mk%20dir%20ansible.png)

2. Create an inventory file:

vim inventory.ini

![touch inventory.ini](./img/Touch%20inventory.ini.png)

![Vi Linux server](./img/Vi%20Linux%20server.png)

3. Add target machine details to the inventory:

[linux_servers]

target1 ansible_host=98.93.9.134 ansible_user=ubuntu

![Cat inventory.ini](./img/Cat%20inventory.ini.png)

4. Save and close the file.

#### Task 4 - Test Ansible Connectivity

1. Test Ansible connectivity to the target machines:

ansible -i inventory.ini linux_servers -m ping

![Ping pong](./img/Ping%20pong.png)

The output should show a pong response from each target machine.

#### Task 5 - Run a Simple Ansible Ad-Hoc Command

1. Run a command to check the uptime of target machines:

ansible -i inventory.ini linux_servers -m command -a "uptime"

![Adhoc command](./img/Adhoc%20command.png)

2. Run a command to check disk usage:

ansible -i inventory.ini linux_servers -m shell -a "df -h"

![Disc usage](./img/Disc%20usage.png)

3. Observe the outputs to confirm successful execution.

Connection was successfully executed.

####  Conclusion

This project demonstrated how to set up Ansible on a Linux server and configure it to manage target machines. You installed Ansible, configured SSH access, created an inventory file, and verified connectivity using ad-hoc commands. With this foundation, you're now prepared to explore more advanced Ansible functionalities like writing playbooks and managing complex infrastructures.