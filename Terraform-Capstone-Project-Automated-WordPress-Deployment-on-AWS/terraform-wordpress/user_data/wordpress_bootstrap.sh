#!/bin/bash
set -e

# Log setup
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1

yum update -y

# Install SSM
yum install -y amazon-ssm-agent
systemctl enable amazon-ssm-agent
systemctl start amazon-ssm-agent

# Install EFS utils & web stack
yum install -y amazon-efs-utils nfs-utils
amazon-linux-extras enable php8.2
yum clean metadata
yum install -y php php-mysqlnd php-fpm php-json php-mbstring php-xml php-gd php-cli php-curl httpd

systemctl enable httpd
systemctl start httpd

# Mount EFS
mkdir -p /var/www/html/wp-content
echo "${EFS_DNS}:/ /var/www/html/wp-content efs _netdev,tls,iam 0 0" >> /etc/fstab
mount -a || true

# Download WordPress
cd /tmp
curl -O https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz
rsync -a /tmp/wordpress/ /var/www/html/

# Move wp-content to EFS
rm -rf /var/www/html/wp-content
mkdir -p /var/www/html/wp-content
mountpoint -q /var/www/html/wp-content || mount -a

chown -R apache:apache /var/www/html/
chmod -R 755 /var/www/html/

# Configure WordPress
cd /var/www/html
cp wp-config-sample.php wp-config.php
sed -i "s/database_name_here/${DB_NAME}/" wp-config.php
sed -i "s/username_here/${DB_USER}/" wp-config.php
sed -i "s/password_here/${DB_PASSWORD}/" wp-config.php
sed -i "s/localhost/${DB_HOST}/" wp-config.php

# Harden wp-config
chmod 640 wp-config.php
chown apache:apache wp-config.php
echo "define('DISALLOW_FILE_EDIT', true);" >> wp-config.php

# Apache vhost
cat > /etc/httpd/conf.d/wordpress.conf <<'EOF'
<VirtualHost *:80>
    DocumentRoot "/var/www/html"
    <Directory "/var/www/html">
        AllowOverride All
        Require all granted
    </Directory>
    ErrorLog "/var/log/httpd/wordpress-error.log"
    CustomLog "/var/log/httpd/wordpress-access.log" combined
</VirtualHost>
EOF

# Enable .htaccess
sed -i 's/AllowOverride None/AllowOverride All/g' /etc/httpd/conf/httpd.conf

# Health check
echo "ok" > /var/www/html/healthz

systemctl restart httpd

