#!/usr/bin/env bash

# Check se o script esta rodando com root
if [[ "$(id -u)" != "0" ]]; then
  echo "This script must be run as root" 1>&2
  exit
fi

BASEDIR=$(dirname "$0")

echo "Adding AWS_PROFILE to /home/$SUDO_USER/.zshrc"
echo -e "
export AWS_PROFILE=sandbox" >> /home/$SUDO_USER/.zshrc

echo "Adding kubectl plugin to /home/$SUDO_USER/.zshrc"
sed -Ei "s/^(plugins=\((.*)\))/plugins=(\2 kubectl)/g" /home/$SUDO_USER/.zshrc