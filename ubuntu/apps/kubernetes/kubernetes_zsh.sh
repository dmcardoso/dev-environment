#!/usr/bin/env bash

# Check se o script esta rodando com root
if [[ "$(id -u)" != "0" ]]; then
  echo "This script must be run as root" 1>&2
  exit
fi

BASEDIR=$(dirname "$0")

echo "Adding kubectl completion to /home/$SUDO_USER/.zshrc"
echo -e "
source <(kubectl completion zsh)" >> /home/$SUDO_USER/.zshrc