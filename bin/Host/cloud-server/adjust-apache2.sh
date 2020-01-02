#!/bin/bash
#
# Script to deploy a wrking cobbler installation in Ubuntu Server 14.10
# Author: Luis Henrique Bolson <luis@luisb.net>
#
# Based on http://springerpe.github.io/tech/2014/09/09/Installing-Cobbler-2.6.5-on-Ubuntu-14.04-LTS.html
#
# Please run as root (don't use sudo <script>)
#
# curl -s https://raw.githubusercontent.com/luisbolson/cobbler/master/cobbler_install-ubuntu_14.04.sh | bash -s 192.168.56.101
#

# Add cobbler repository

# Move Cobbler Apache config to the right place
cp /etc/apache2/conf.d/cobbler.conf /etc/apache2/conf-available/
cp /etc/apache2/conf.d/cobbler_web.conf /etc/apache2/conf-available/

# Enable the above config
a2enconf cobbler cobbler_web

# Enable Proxy modules
a2enmod proxy
a2enmod proxy_http

# Fix Apache conf to match 2.4 configuration
sed -i "/Order allow,deny/d" /etc/apache2/conf-enabled/cobbler*.conf
sed -i "s/Allow from all/Require all granted/" /etc/apache2/conf-enabled/cobbler*.conf

# Get Loaders
cobbler get-loaders

# Update Cobbler Signatures
cobbler signature update

