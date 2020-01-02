#!/bin/bash

umount -a

/etc/init.d/apache2         stop
/etc/init.d/cobblerd        stop
/etc/init.d/ssh             stop
#/etc/init.d/autofs          stop
/etc/init.d/nfs-common      stop
#/etc/init.d/inetutils-inetd stop
/etc/init.d/tftpd-hpa       stop
/etc/init.d/rpcbind         stop
#/etc/init.d/tlp             stop
/etc/init.d/cron            stop
/etc/init.d/rsyslog         stop


