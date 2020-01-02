export OS_NAME=`lsb_release -i | cut -f 2 -d ':' | tr -d '\t'`
export OS_RELEASE_NAME=`lsb_release -c | cut -f 2 -d ':' | tr -d '\t'`
export OS_VERSION=`lsb_release -r | cut -f 2 -d ':' | tr -d '\t'`

export BIN_DIR=`dirname ${BASH_SOURCE[0]}`
export HOST_DIR=${BIN_DIR}/Host
export DOMAIN_DIR=${BIN_DIR}/Domain
export OS_DIR=${BIN_DIR}/OperatingSystem

export HOSTNAME_DIR=${HOST_DIR}/`hostname`
export DOMAINNAME_DIR=${DOMAIN_DIR}/`domainname`
export OS_NAME_DIR=${OS_DIR}/${OS_NAME}
export OS_RELEASE_NAME_DIR=${OS_NAME_DIR}/${OS_RELEASE_NAME}
export OS_RELEASE_DIR=${OS_RELEASE_NAME_DIR}/${OS_VERSION}

