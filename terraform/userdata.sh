#!/bin/bash

# Install Apache
sudo apt update -y
sudo apt install apache2 -y
sudo systemctl start apache2 #Optional
sudo systemctl enable apache2 #Optional

# Install PHP and dependencies
sudo apt install php libapache2-mod-php php-mysql php-xml php-mbstring php-curl php-zip -y

# Install MySQL
sudo apt install mysql-server -y

# Configure MySQL database and user
mysql -e "CREATE DATABASE wordpress;"
mysql -e "CREATE USER 'umarsatti'@'localhost' IDENTIFIED BY 'P@ssw0rd';"
mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'umarsatti'@'localhost';"
mysql -e "FLUSH PRIVILEGES;"

# Download and install WordPress
wget https://wordpress.org/latest.tar.gz -P /tmp
tar -xzf /tmp/latest.tar.gz -C /tmp

# Move WordPress files directly into the Apache root directory
rm -rf /var/www/html/*
mv /tmp/wordpress/* /var/www/html/

# Change permissions
chown -R www-data:www-data /var/www/html/
chmod -R 755 /var/www/html/

# Configure Wordpress to connect to MySQL database
cp /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php
sed -i "s/database_name_here/wordpress/" /var/www/html/wordpress/wp-config.php
sed -i "s/username_here/umarsatti/" /var/www/html/wordpress/wp-config.php
sed -i "s/password_here/P@ssw0rd/" /var/www/html/wordpress/wp-config.php

# Restart Apache
systemctl restart apache2
