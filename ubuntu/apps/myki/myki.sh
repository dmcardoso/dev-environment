#!/usr/bin/env bash

# Check se o script esta rodando com root
if [[ "$(id -u)" != "0" ]]; then
  echo "This script must be run as root" 1>&2
  exit
fi

BASEDIR=$(dirname "$0")

curl -L https://static.myki.com/releases/da/MYKI-latest-amd64.deb -o "${BASEDIR}/myki.deb"

dpkg -i "${BASEDIR}/myki.deb"

rm -rf "${BASEDIR}/myki.deb"