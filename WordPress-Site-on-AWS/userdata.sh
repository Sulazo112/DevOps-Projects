#!/bin/bash

dnf update -y

# Install SSM Agent
dnf install -y amazon-ssm-agent
systemctl enable amazon-ssm-agent
systemctl start amazon-ssm-agent

# Install Apache
dnf install -y httpd
systemctl enable httpd
systemctl start httpd

# Install PHP 8.2
dnf install -y php php-mysqlnd php-fpm php-json php-xml php-gd php-mbstring

# Create web root
mkdir -p /var/www/html

# Mount EFS
echo "fs-0607fc8fb62b832d8.efs.eu-west-3.amazonaws.com:/ /var/www/html efs defaults,_netdev 0 0" >> /etc/fstab
mount -a

# Install WordPress
cd /var/www/html
curl -O https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz --strip-components=1
rm -f latest.tar.gz

# Permissions
chown -R apache:apache /var/www/html
chmod -R 755 /var/www/html

systemctl restart httpd

