#!/usr/bin/env bash

# Check se o script esta rodando com root
if [[ "$(id -u)" != "0" ]]; then
   echo "This script must be run as root" 1>&2
   exit
fi

BASEDIR=$(dirname "$0")

# Download e instalação
wget "http://download3.navicat.com/download/navicat121_premium_en_x64.tar.gz" -O /tmp/navicat.tar.gz
tar -zvxf /tmp/navicat.tar.gz -C /tmp
mv /tmp/navicat121_premium_en_x64 /opt/navicat
rm -f /tmp/navicat.tar.gz

# Icone de inicialização
cp ${BASEDIR}/assets/icon.png /opt/navicat/icon.png
cp ${BASEDIR}/assets/navicat.desktop /usr/share/applications/navicat.desktop
