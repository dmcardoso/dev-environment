#!/usr/bin/env bash

# Check se o script esta rodando com root
if [[ "$(id -u)" != "0" ]]; then
   echo "This script must be run as root" 1>&2
   exit
fi

BASEDIR=$(dirname "$0")

dpkg -i ${BASEDIR}/assets/woeusb_3.3.1-1_webupd8_bionic0_amd64.deb
sudo apt install -f