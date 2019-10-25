#!/bin/bash
#
# Ubuntu 18.04 und Apache2
#
# Domain configuration with SSL certificate
#
# a2_conf_domain.sh                         |        |`-.__
#                                           |        / ' _/
# Version 1.0                               |        ====`
#                                           |       /    }
# Date: 2019-10-25                          |   @  /  \ /
#                                           |by  UniAtika
# Public Domain                             |  

### Set variables
export GREEN="\e[32m" 
export BLUE="\e[34m"

### 1. Step - Query domain name
clear;
echo "Enter the name of the domain to be configured."
echo "Use it without www, http or https:"
echo -e "${BLUE}Please enter your domain name:" ;tput sgr0
read DOMAIN

### 2. Step - Create directory and adjust rights
sudo mkdir /var/www/$DOMAIN
sudo chown -R www-data:www-data /var/www/$DOMAIN
 
### 3. Step - Write Apache configuration file
printf "
<VirtualHost *:80>
    ServerAdmin admin@$DOMAIN
    ServerName $DOMAIN
    ServerAlias www.$DOMAIN
    DocumentRoot /var/www/$DOMAIN/
    ErrorLog \${APACHE_LOG_DIR}/error.log
    CustomLog \${APACHE_LOG_DIR}/access.log combined
</VirtualHost>" | sudo tee /etc/apache2/sites-available/$DOMAIN.conf
 
### 4. Step - Enable VirtualHost configuration for domain
sudo a2ensite $DOMAIN.conf;

### 5. Step - Reboot Apache
systemctl reload apache2;

### 6. Step - Get SSL certificates
clear;
echo -e "${GREEN}It will create an SSL certificate for the following domain: $DOMAIN" ;tput sgr0
sleep 2
sudo certbot --apache -d $DOMAIN -d www.$DOMAIN

### 7. Step - Create test page
echo -e "${GREEN}A test page will be created for the following domain: https://$DOMAIN" ;tput sgr0
printf "
<p>This is a simple test page</p>" | sudo tee /var/www/$DOMAIN/index.php

### 8. Step - Manual check
clear;
echo -e "${GREEN}Enter the following domain in the browser: $DOMAIN" ;tput sgr0
sleep 5;
exit 0;
