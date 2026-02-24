#  Backup and Restore Files on a Linux Server using Ansible

### Introduction

Data backup and restoration are essential practices for ensuring data safety and continuity in Linux server management. Ansible, an automation tool, simplifies these tasks by providing a scalable and repeatable solution.

This project will guide us through creating Ansible playbooks to automate the backup and restore process for files on a Linux server.

### Objectives

1. Understand the basics of Ansible and its role in automation.
2. Set up an Ansible environment for managing Linux servers.
3. Create a playbook to back up files to a remote or local directory.
4. Develop a playbook to restore files from a backup.
5. Test and verify the backup and restore processes.

### Prerequisites

1. Linux Servers: At least one server to act as the target machine and an optional control machine for Ansible.
2. Ansible Installed: Ansible installed on the control machine. (Refer to the Ansible installation 3.guide to install it if not already installed.)
3. SSH Access: SSH access between the control machine and target servers with public key authentication.
4. Tools: A text editor to create and edit Ansible playbooks.

#### Tasks Outline

1. Install and configure Ansible on the control machine.
2. Set up an inventory file for the target Linux server.
3. Create an Ansible playbook to back up files. Create an Ansible playbook to restore files from a backup.
4. Test the backup and restore functionality.

### Project Tasks

#### Task 1 - Install and Configure Ansible

1. Install Ansible on the control machine (Ubuntu example):

On this project, I will be using Ubuntu created on AWS and login to the ubuntu Linux server.

![Ansible controller](./img/Ansible%20Controller.png)

Login to the ubuntu server and update.

1. Update the package repository

sudo apt update

![Sudo update](./img/Sudo%20apt%20update.png)

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

ssh ubuntu@54.221.50.28

![Cd .ssh access](./img/CD%20.ssh.png)

![Ct authorized key](./img/Cat%20authorized%20key.png)

![SSH access without password](./img/SSH%20access%20without%20password.png)

We have now successfully configured a passwordless SSH access.

#### Task 2 - Set Up the Ansible Inventory File

1. Create a directory for Ansible configuration:

mkdir ~/ansible cd ~/ansible

![Mkdir ansible](./img/Mk%20dir%20ansible.png)

2. Create an inventory file:

vim inventory.ini

![Touch inventory.ini](./img/Touch%20inventory.ini.png)

3. Add target machine details to the inventory:

[linux_servers] target ansible_host=54.221.50.28 ansible_user=ubuntu

![Cat inventory.ini](./img/Cat%20inventory.ini.png)

4. Save and close the file.

#### Task 3 - Create an Ansible Playbook to Back Up Files

1. Create a playbook file for backup:

vi backup.yml

![Touch backup.yml](./img/Touch%20backup.yml.png)

2. Add the following playbook content:

![Backup configuration](./img/Backup%20Configuration.png)

3. Replace /path/to/files with the path of the files you want to back up.

To get the appropite file path in linux use the command below:

ls "$PWD/file.txt" # or echo "$PWD/file.txt"

![File path](./img/Path%20to%20file.png)

![Vi backup.yml](./img/Vi%20backup.yml.png)

#### Task 4 - Create an Ansible Playbook to Restore Files

1. Create a playbook file for restoration:

vi restore.yml

![Touch restore.yml](./img/Touch%20restore.yml.png)

2. Add the following playbook content:

![Backup restore snippet](./img/Backup%20Restore%20snippet.png)

![Vi restore.yml](./img/Vi%20restore.yml.png)

![Cat restore.yml](./img/Cat%20restore.yml.png)

3. Replace /path/to/files with the original file location.

#### Task 5 - Test the Backup and Restore Functionality

1. Run the backup playbook:

ansible-playbook -i inventory.ini backup.yml

![Run backup playbook](./img/Run%20backup%20playbook.png)

2. Verify the backup directory and files on the target server:

ls /backup

![Ls backup](./img/Ls%20backup.png)

3. Run the restore playbook:

ansible-playbook -i inventory.ini restore.yml

![Run restore playbook](./img/Run%20restore%20playbook.png)

4. Verify the restored files in the original location on the target server:

ls /path/to/files

Check/Veriyf directly on the target server: ls -l /var/www/mywebsite

Check/Verify on the control node: ansible web_servers -i inventory.ini -m shell -a "ls -l /var/www/mywebsite"

![Verify on target server](./img/Verify%20on%20target%20server.png)

![Verify on control node](./img/Verify%20on%20conrol%20node.png)

#### Conclusion

This project introduced you to automating file backup and restoration on a Linux server using Ansible. You set up an Ansible environment, created playbooks for backup and restoration, and verified the process. With these skills, you can extend the playbooks to include more servers, schedule regular backups, or integrate advanced options like compression or encryption.

END.

