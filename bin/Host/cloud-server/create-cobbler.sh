#!/bin/bash

apt-get install -y make git apache2 python-yaml python-cheetah python-netaddr python-simplejson python-urlgrabber libapache2-mod-wsgi python-django atftpd yum-utils lsb

make install devinstall webtest

a2enmod proxy
a2enmod proxy_http
a2enmod rewrite

ln -s /etc/apache2/conf-available/cobbler.conf /etc/apache2/conf-enabled/
ln -s /etc/apache2/conf-available/cobbler_web.conf /etc/apache2/conf-enabled
ln -s /usr/local/lib/python2.6/dist-packages/cobbler /usr/lib/python2.6/dist-packages/
ln -s /usr/local/lib/python2.7/dist-packages/cobbler /usr/lib/python2.7/dist-packages/ 

chown www-data /var/lib/cobbler/webui_sessions

    #/etc/cobbler/settings server: 192.168.168.31

htdigest /etc/cobbler/users.digest "Cobbler" cobbler

SECRET_KEY=$(python -c 'import re;from random import choice; import sys; sys.stdout.write(re.escape("".join([choice("abcdefghijklmnopqrstuvwxyz0123456789^&*(-_=+)") for i in range(100)])))') 

sed -i "s/^SECRET_KEY = .*/SECRET_KEY = '${SECRET_KEY}'/" /usr/local/share/cobbler/web/settings.py
