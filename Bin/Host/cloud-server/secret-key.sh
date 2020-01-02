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

# Generate a new django secret key
SECRET_KEY=$(python -c 'import re;from random import choice; import sys; sys.stdout.write(re.escape("".join([choice("abcdefghijklmnopqrstuvwxyz0123456789^&*(-_=+)") for i in range(100)])))')
sed -i "s/^SECRET_KEY = .*/SECRET_KEY = '${SECRET_KEY}'/" /usr/local/share/cobbler/web/settings.py
#sed -i "s/^SECRET_KEY = .*/SECRET_KEY = '${SECRET_KEY}'/" /usr/share/cobbler/web/settings.py

#/root/Development/github/cobbler/web/settings.py
#/root/Development/github/cobbler/cobbler/settings.py
#/root/Development/github/cobbler/build/lib.linux-armv5tel-2.7/cobbler/settings.py
#/usr/lib/python2.7/dist-packages/django/conf/project_template/project_name/settings.py
#/usr/local/share/cobbler/web/settings.py
#/usr/local/lib/python2.7/dist-packages/cobbler/settings.py
