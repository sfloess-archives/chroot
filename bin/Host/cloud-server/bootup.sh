#!/bin/sh -x

activate_chroot() {

	if grep -q $debdir/sys /proc/mounts && grep -q $debdir/proc /proc/mounts; then
		return # already active
	fi

	grep -Ev ^rootfs\|^/dev/loop0\|/rootmnt\|aufs /proc/mounts > $debdir/etc/mtab

	#mkdir -p $debdir/proc $debdir/sys $debdir/dev $debdir/dev/pts $debdir/tmp

	mount -o bind  /proc $debdir/proc
	#mount -t usbfs usbfs $debdir/proc/bus/usb
	mount -o bind  /sys  $debdir/sys
	mount -o bind  /dev  $debdir/dev
	mount -t devpts none $debdir/dev/pts
	mount -o bind  /tmp  $debdir/tmp

	grep -E ^/dev/dm-[0-9]\|^/dev/md[0-9]\|^/dev/sd[a-z][1-9] /proc/mounts | while read mpart mpt rest; do
		mkdir -p $debdir/$mpt
		mount -o bind $mpt $debdir/$mpt
	done

	cp /etc/hostname $debdir/etc/hostname
	cp /etc/resolv.conf $debdir/etc/resolv.conf
	cp /etc/hosts $debdir/etc/hosts
}

board=$(cat /tmp/board)
model=${board%-*}
debdir=/mnt/md0
#debdir=/mnt/sda2

activate_chroot

chroot $debdir "$*"
exit $?
