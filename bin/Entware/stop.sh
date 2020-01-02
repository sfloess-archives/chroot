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

ENTWARE_DIR=/mnt/sda1/entware

# ---------------------------------------------------------------------

unmountEntwareDirs() {
    for nfsDir in ${NFS_DIRS}
    do
	MOUNT_DIR=${DEBIAN_DIR}/mnt/admin-ap/`basename ${nfsDir}`

        fusermount -u ${MOUNT_DIR}
    done
}

stopEntwareApps() {
    if [ -e `dirname $0`/`hostname`/stop-entware.sh ]
    then
        `dirname $0`/`hostname`/stop-entware.sh >> /tmp/flossware.log 2>&1
    fi
}

stopEntware() {
    stopEntwareApps

    unmountEntwareDirs

    /opt/etc/init.d/rc.unslung stop

    umount /opt
}

# --------------------------------------------------------------

stopEntware

# --------------------------------------------------------------