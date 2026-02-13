#!/bin/bash
set -e

# Update and install Apache (Amazon Linux uses httpd)
sudo yum update -y
sudo yum install -y httpd

# Enable and start Apache
sudo systemctl enable httpd
sudo systemctl start httpd

# Simple index page
EC2_HOSTNAME="$(hostname -f || hostname)"
echo "<h1>Hello World from ${EC2_HOSTNAME}</h1>" | sudo tee /var/www/html/index.html

