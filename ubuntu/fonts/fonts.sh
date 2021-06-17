#!/usr/bin/env bash

# Check se o script esta rodando com root
if [[ "$(id -u)" != "0" ]]; then
   echo "This script must be run as root" 1>&2
   exit
fi

BASEDIR=$(dirname "$0")

mkdir -p /usr/share/fonts/Minhas\ Fonts
cp -r ${BASEDIR}/assets/* /usr/share/fonts/Minhas\ Fonts
fc-cache -v -f
