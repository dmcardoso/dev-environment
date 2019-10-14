#!/usr/bin/env bash

# Check se o script esta rodando com root
if [[ "$(id -u)" != "0" ]]; then
   echo "This script must be run as root" 1>&2
   exit
fi

BASEDIR=$(dirname "$0")

# Faz o download da nova versão e instala
wget "https://github.com/Ulauncher/Ulauncher/releases/download/4.4.0.r1/ulauncher_4.4.0.r1_all.deb" -O /tmp/ulauncher.deb
dpkg -i /tmp/ulauncher.deb
apt-get install -f -y
rm -f /tmp/ulauncher.deb