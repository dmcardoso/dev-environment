#!/usr/bin/env bash

# Check se o script esta rodando com root
if [[ "$(id -u)" != "0" ]]; then
  echo "This script must be run as root" 1>&2
  exit
fi

TERMINATOR=/home/$SUDO_USER/.config/terminator
BASEDIR="$(cd "$(dirname "$0")" && pwd)"

apt install terminator -y

sudo -i -u ${SUDO_USER} mkdir -p $TERMINATOR

sudo -i -u ${SUDO_USER} cp ${BASEDIR}/assets/config ${TERMINATOR}/config