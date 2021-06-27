#!/usr/bin/env bash

# Check se o script esta rodando com root
if [[ "$(id -u)" != "0" ]]; then
  echo "This script must be run as root" 1>&2
  exit
fi

BASEDIR=$(dirname "$0")

echo "Adding docker-compose and docker plugins to /home/$SUDO_USER/.zshrc"
sed -Ei "s/^(plugins=\((.*)\))/plugins=(\2 docker docker-compose)/g" /home/$SUDO_USER/.zshrc