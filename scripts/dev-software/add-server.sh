#!/bin/bash
# add-server.sh

echo "Installing LAMP development server..."
sleep 2

sudo "$pkg_manager" install -y apache2 apache2-utils libapache2-mod-php php php-cli php-fpm php-json php-xml php-mbstring php-mysql php-pear php-gd php-pdo php-bcmath php-curl php-zip

echo ""
echo "Allowing HTTP(S) and refreshing..."
sudo ufw allow http
sudo ufw allow https
sudo ufw reload

echo ""
echo "Firewall is ready."
sleep 2
clear

echo "Starting settings for MariaDB/MySQL..."
echo ""
sudo mysql_secure_installation -y

echo ""
echo "REMINDER: password for 'root' is now empty by default for local development. In order to serve web files online (optional), it is highly recommended to set a secure one later."
sleep 2
clear

sudo systemctl enable apache2
sudo systemctl enable mysql
echo "LAMP server will run at system start"
sleep 2

echo ""
echo "Success."
sleep 2
clear