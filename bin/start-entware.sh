#!/bin/sh

# ---------------------------------------------------------------------

ENTWARE_DIR=/mnt/sda1/entware

NFS_DIRS='root home opt/backups opt/media opt/nas opt/shared'

# ---------------------------------------------------------------------

mountEntwareDirs() {
    modprobe fuse
    insmod   fuse

    for nfsDir in ${NFS_DIRS}
    do
	MOUNT_DIR=${DEBIAN_DIR}/mnt/admin-ap/`basename ${nfsDir}`

	mkdir -p ${MOUNT_DIR}

        /opt/bin/nfusr nfs://admin-ap/${nfsDir} ${MOUNT_DIR}
    done
}

startEntwareApps() {
    if [ -e `dirname $0`/`hostname`/start-entware.sh ]
    then
        `dirname $0`/`hostname`/start-entware.sh >> /tmp/flossware.log 2>&1
    else
	echo "No entware script for host:  `dirname $0`/`hostname`/start-entware.sh" >> /tmp/flossware.log 2>&1
    fi
}

startEntware() {
    mount -o bind ${ENTWARE_DIR} /opt

    /opt/etc/init.d/rc.unslung start

    mountEntwareDirs

    startEntwareApps
}

# ---------------------------------------------------------------------

echo "`dirname $0`/`hostname`/start-entware.sh" >> /tmp/flossware.log
echo "${DEBIAN_DIR}/mnt/admin-ap/root/Development/github/sfloess/dd-wrt/`hostname`/start-debian.sh" >> /tmp/flossware.log

mount /dev/sda1 /mnt/sda1 >> /tmp/flossware.log 2>&1

startEntware >> /tmp/flossware.log 2>&1

# --------------------------------------------------------------
