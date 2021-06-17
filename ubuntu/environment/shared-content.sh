#!/usr/bin/env bash

# Check se o script esta rodando com root
if [[ "$(id -u)" != "0" ]]; then
   echo "This script must be run as root" 1>&2
   exit
fi

BASEDIR="$(cd "$(dirname "$0")" && pwd)"
UBUNTU_DIR="$(cd "$(dirname "$0")" && cd .. && pwd)"

GROUP="shared"
SHARED_PATH="/home/shared"

groupadd $GROUP
mkdir $SHARED_PATH
chgrp $GROUP $SHARED_PATH
chmod 770 $SHARED_PATH

# Herança de permissões para subpastas
chmod +s $SHARED_PATH
usermod -aG $GROUP $SUDO_USER