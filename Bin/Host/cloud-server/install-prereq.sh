#!/bin/bash

apt-get install -y rsyslog rpcbind inetutils-inetd nfs-common apache2 htop vim python3 git make python3-pip

apt-get install -y createrepo apache2 genisoimage libapache2-mod-wsgi libapache2-mod-ssl python-cheetah python-netaddr python-simplejson python-urlgrabber python-yaml rsync

apt-get install -y git make python3-dev python3-setuptools python3-cheetah openssl
apt-get install apache2-dev
apt-get install yum-utils tftpd-hpa
apt-get install libapache2-mod-wsgi-py3
apt-get install postfix alpine lsb-release locales genders sudo genisoimage

# ------------------------

apt-get install python-pip python-yaml python-simplejson python-cheetah pxelinux isolinux syslinux-common libapache2-mod-wsg
pip2 install netaddr yaml

ln -s /usr/lib/PXELINUX/pxelinux.0 /usr/lib/syslinux/pxelinux.0
ln -s /usr/lib/selinux/modules/bios/menu.c32 /usr/lib/syslinux/menu.c32
ln -s /usr/lib/ISOLINUX/isolinux.bin /usr/lib/syslinux/isolinux.bin
ln -s /usr/lib/syslinux/menu.c32 /var/lib/cobbler/loaders/menu.c32
ln -s /usr/lib/selinux/modules/bios/chain.c32 /usr/lib/syslinux/chain.c32
ln -s /usr/bin/genisoimage /usr/bin/mkisofs

cp /usr/lib/syslinux/modules/bios/ldlinux.c32 /srv/tftpboot

a2enmod wsgi
a2enmod proxy
a2enmod proxy_http
a2enmod rewrite

# ------------------------


touch /etc/genders

pip3 install future distro coverage
pip3 install requests Django dnspython ldap3 mod_wsgi netaddr pymongo pyyaml simplejson tornado
pip3 install netaddr
pip3 install repo
pip3 install items

#----------------------------
# /etc/default/tftpd-hpa

# TFTP_OPTIONS="--secure --ipv4 --create --permissive"
#----------------------------

