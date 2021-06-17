#!/usr/bin/env bash

# Check se o script esta rodando com root
if [[ "$(id -u)" != "0" ]]; then
   echo "This script must be run as root" 1>&2
   exit
fi

BASEDIR=$(dirname "$0")

curl -L https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb -o "${BASEDIR}/dbeaver.deb"

dpkg -i "${BASEDIR}/dbeaver.deb"

rm -rf "${BASEDIR}/dbeaver.deb"