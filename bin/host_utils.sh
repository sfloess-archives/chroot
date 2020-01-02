#!/bin/bash

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

# ---------------------------------------------------------------------
# Setup variables...
# ---------------------------------------------------------------------

export OS_NAME=`lsb_release -i | cut -f 2 -d ':' | tr -d '\t'`
export OS_RELEASE_NAME=`lsb_release -c | cut -f 2 -d ':' | tr -d '\t'`
export OS_VERSION=`lsb_release -r | cut -f 2 -d ':' | tr -d '\t'`

export BIN_DIR=/root/Bin
export HOST_DIR=${BIN_DIR}/Host
export DOMAIN_DIR=${BIN_DIR}/Domain
export OS_DIR=${BIN_DIR}/OperatingSystem

export HOSTNAME_DIR=${HOST_DIR}/`hostname`
export DOMAINNAME_DIR=${DOMAIN_DIR}/`domainname`
export OS_NAME_DIR=${OS_DIR}/${OS_NAME}
export OS_RELEASE_NAME_DIR=${OS_NAME_DIR}/${OS_RELEASE_NAME}
export OS_RELEASE_DIR=${OS_RELEASE_NAME_DIR}/${OS_VERSION}


MACHINE_TYPE=`uname -m`

# --------------------------------------------------------------
# Hosts allowed to use installation and this family of software
# modules.
# --------------------------------------------------------------

declare -A HOSTS

HOSTS["admin-ap"]="admin-ap"
HOSTS["cloud-ap"]="cloud-ap"
HOSTS["desktop-ap"]="desktop-ap"
HOSTS["bedroom-ap"]="bedroom-ap"
HOSTS["den-ap"]="den-ap"
HOSTS["cloud-server"]="cloud-server"
HOSTS["pi-01"]="pi-01"
HOSTS["pi-02"]="pi-02"

# --------------------------------------------------------------
# Host dir where things are run and installed to/from.
# --------------------------------------------------------------

declare -A HOST_DIR

HOST_DIR["admin-ap"]="/tmp/mnt/sda0"
HOST_DIR["cloud-ap"]="/tmp/mnt/sda1"
HOST_DIR["desktop-ap"]="/tmp/mnt/sda1"
HOST_DIR["bedroom-ap"]="/tmp/mnt/sda1"
HOST_DIR["den-ap"]="/tmp/mnt/sda1"
HOST_DIR["cloud-server"]="/mnt/md0"

# --------------------------------------------------------------
# Host dir where things are run and installed to/from.
# --------------------------------------------------------------

ARMEL_HOST="armel"
ARMHF_HOST="armhf"
MIPS_HOST="mips"
AMRV5_TEL_HOST="armv5tel"

declare -A HOST_ARCH

HOST_ARCH["admin-ap"]="${ARMHF_HOST}"
HOST_ARCH["cloud-ap"]="${ARMHF_HOST}"
HOST_ARCH["desktop-ap"]="${ARMEL_HOST}"
HOST_ARCH["bedroom-ap"]="${ARMEL_HOST}"
HOST_ARCH["den-ap"]="${MIPS_HOST}"
HOST_ARCH["cloud-server"]="${AMRV5_TEL_HOST}"

# --------------------------------------------------------------
# Location of Entware installations.
# --------------------------------------------------------------

declare -A HOST_ENTWARE_DIR

HOST_ENTWARE_DIR["desktop-ap"]="${HOST_DIR[desktop-ap]}/entware"
HOST_ENTWARE_DIR["bedroom-ap"]="${HOST_DIR[bedroom-ap]}/entware"

# --------------------------------------------------------------
# Location of Debian installations.
# --------------------------------------------------------------

declare -A HOST_DEBIAN_DIR

HOST_DEBIAN_DIR["admin-ap"]="${HOST_DIR[admin-ap]}/debian_${HOST_ARCH[admin-ap]}"
HOST_DEBIAN_DIR["cloud-ap"]="${HOST_DIR[cloud-ap]}/debian_${HOST_ARCH[cloud-ap]}"
HOST_DEBIAN_DIR["desktop-ap"]="${HOST_DIR[desktop-ap]}/debian_${HOST_ARCH[desktop-ap]}"
HOST_DEBIAN_DIR["bedroom-ap"]="${HOST_DIR[bedroom-ap]}/debian_${HOST_ARCH[bedroom-ap]}"
HOST_DEBIAN_DIR["cloud-server"]="${HOST_DIR[cloud-server]}"

# --------------------------------------------------------------
# Debian services.
# --------------------------------------------------------------

declare -A HOST_DEBIAN_SERVICES

HOST_DEBIAN_SERVICES["admin-ap"]="dnsmasq ntp rsyslog cron rpcbind nfs-common nfs-kernel-server postfix dovecot nis ssh nmbd smbd rsync plexmediaserver"
HOST_DEBIAN_SERVICES["cloud-ap"]="ryslog ntp cron rpcbind nfs-common nfs-kernel-server postfix nis ssh rsync mysql postfix"
HOST_DEBIAN_SERVICES["desktop-ap"]="rsyslog ntp cron rpcbind postfix nis ssh"
HOST_DEBIAN_SERVICES["bedroom-ap"]="ryslog ntp cron rpcbind postfix ssh"
HOST_DEBIAN_SERVICES["cloud-server"]="rsyslog cron rpcbind tftpd-hpa nfs-common ssh cobblerd apache2"

# --------------------------------------------------------------