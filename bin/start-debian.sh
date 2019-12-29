#!/bin/sh

# ---------------------------------------------------------------------

#
# This file is part of the Scot P. Floess family of personal 
# open source software.
#
# This is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 3
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA
#

# ---------------------------------------------------------------------

. `dirname ${BASH_SOURCE[0]}`/host-utils.sh

# ---------------------------------------------------------------------

DEBIAN_DIR=/mnt/sda1/debian_armel

# ---------------------------------------------------------------------

mountDebianDirs() {
    mount -o bind   /dev  ${DEBIAN_DIR}/dev
    mount -o bind   /proc ${DEBIAN_DIR}/proc
    mount -o bind   /sys  ${DEBIAN_DIR}/sys
    mount -o bind   /tmp  ${DEBIAN_DIR}/tmp

    mount -t devpts none  ${DEBIAN_DIR}/dev/pts

    mkdir -p ${DEBIAN_DIR}/mnt/`hostname`
    mount -o bind / ${DEBIAN_DIR}/mnt/`hostname`
}

copyDebianFiles() {
    cp /etc/mtab ${DEBIAN_DIR}/etc/mtab
    cp /etc/mtab ${DEBIAN_DIR}/etc/fstab

    rm -rf ${DEBIAN_DIR}/lib/modules/*                                        
    cp -rf /lib/modules/`uname -r` ${DEBIAN_DIR}/lib/modules/  
}

startDebianApps() {
    if [ -e ${DEBIAN_DIR}/mnt/admin-ap/root/Development/github/sfloess/dd-wrt/`hostname`/start-debian.sh ]
    then
        /usr/sbin/chroot ${DEBIAN_DIR} /mnt/admin-ap/root/Development/github/sfloess/dd-wrt/`hostname`/start-debian.sh >> /tmp/flossware.log 2>&1
    else
	echo "No debian script for host:  ${DEBIAN_DIR}/mnt/admin-ap/root/Development/github/sfloess/dd-wrt/`hostname`/start-debian.sh" >> /tmp/flossware.log
    fi
}

startDebian() {
    mountDebianDirs
    copyDebianFiles

    startDebianApps
}

# --------------------------------------------------------------

echo "${DEBIAN_DIR}/mnt/admin-ap/root/Development/github/sfloess/dd-wrt/`hostname`/start-debian.sh" >> /tmp/flossware.log

mount /dev/sda1 /mnt/sda1 >> /tmp/flossware.log 2>&1

startDebian  >> /tmp/flossware.log 2>&1

# --------------------------------------------------------------