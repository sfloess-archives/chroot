#!/bin/bash

# ------------------------

ln -s /usr/lib/PXELINUX/pxelinux.0 /usr/lib/syslinux/pxelinux.0
ln -s /usr/lib/syslinux/modules/bios/menu.c32 /var/lib/cobbler/loaders/menu.c32
ln -s /usr/lib/syslinux/modules/bios/menu.c32 /usr/lib/syslinux/menu.c32
ln -s /usr/lib/syslinux/modules/bios/chain.c32 /usr/lib/syslinux/chain.c32
ln -s /usr/lib/ISOLINUX/isolinux.bin /usr/lib/syslinux/isolinux.bin
ln -s /usr/bin/genisoimage /usr/bin/mkisofs

# ------------------------

