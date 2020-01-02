#!/bin/bash -x

mkdir -p /mnt/admin-ap/backups
mkdir -p /mnt/admin-ap/home
mkdir -p /mnt/admin-ap/nas
mkdir -p /mnt/admin-ap/root
mkdir -p /mnt/admin-ap/shared

mount admin-ap:/home        /mnt/admin-ap/home
mount admin-ap:/opt/backups /mnt/admin-ap/backups
mount admin-ap:/opt/nas     /mnt/admin-ap/nas
mount admin-ap:/opt/shared  /mnt/admin-ap/shared
mount admin-ap:/root        /mnt/admin-ap/root

