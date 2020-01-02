#!/bin/bash

# ------------------------

apt-get install -y rsyslog rpcbind inetutils-inetd nfs-common apache2 htop vim git make python-pip python-yaml python-simplejson python-cheetah pxelinux isolinux syslinux-common libapache2-mod-wsg

apt-get install -y createrepo apache2 genisoimage libapache2-mod-wsgi libapache2-mod-ssl python-cheetah python-netaddr python-simplejson python-urlgrabber python-yaml rsync

apt-get install -y git make apache2-dev yum-utils tftpd-hpa postfix alpine lsb-release locales genders sudo genisoimage python-pip libapache2-mod-wsgi tftp-hpa pxelinux isolinux python-django rsync

apt-get install -y cron ssh

# ------------------------

pip2 install netaddr pyyml simplejson cheetah mod-wsgi

# ------------------------

ln -s /usr/lib/PXELINUX/pxelinux.0 /usr/lib/syslinux/pxelinux.0
ln -s /usr/lib/syslinux/modules/bios/menu.c32 /var/lib/cobbler/loaders/menu.c32
ln -s /usr/lib/syslinux/modules/bios/menu.c32 /usr/lib/syslinux/menu.c32
ln -s /usr/lib/syslinux/modules/bios/chain.c32 /usr/lib/syslinux/chain.c32
ln -s /usr/lib/ISOLINUX/isolinux.bin /usr/lib/syslinux/isolinux.bin
ln -s /usr/bin/genisoimage /usr/bin/mkisofs

cp /usr/lib/syslinux/modules/bios/ldlinux.c32 /srv/tftp
cp /usr/lib/syslinux/modules/bios/libutil.c32 /srv/tftp
cp /usr/lib/syslinux/modules/bios/menu.c32    /srv/tftp
cp /usr/lib/syslinux/modules/bios/ldlinux.c32 /usr/lib/syslinux/ldlinux.c32

# ------------------------

cp /usr/lib/syslinux/modules/bios/ldlinux.c32 /srv/tftpboot

# ------------------------

a2enmod wsgi
a2enmod proxy
a2enmod proxy_http
a2enmod rewrite

# ------------------------

