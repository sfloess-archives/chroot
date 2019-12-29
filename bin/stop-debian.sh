#!/bin/sh

# ---------------------------------------------------------------------
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
# ---------------------------------------------------------------------

. `dirname ${BASH_SOURCE[0]}`/host-utils.sh

# ---------------------------------------------------------------------

DEBIAN_DIR=/debian_armel

# ---------------------------------------------------------------------

unmountDebianDirs() {
    umount ${DEBIAN_DIR}/mnt/`hostname`
    umount ${DEBIAN_DIR}/dev/pts
    umount ${DEBIAN_DIR}/tmp

    umount ${DEBIAN_DIR}/sys
    umount ${DEBIAN_DIR}/proc
    umount ${DEBIAN_DIR}/dev
}

shutdownDebianApps() {
    if [ -e ${DEBIAN_DIR}/mnt/admin-ap/root/Development/github/sfloess/dd-wrt/`hostname`/stop-debian.sh ]
    then
        /usr/sbin/chroot ${DEBIAN_DIR} /mnt/admin-ap/root/Development/github/sfloess/dd-wrt/`hostname`/stop-debian.sh >> /tmp/flossware.log 2>&1
    fi
}

stopDebian() {
    shutdownDebianApps

    unmountDebianDirs
}

# --------------------------------------------------------------

stopDebian

# --------------------------------------------------------------