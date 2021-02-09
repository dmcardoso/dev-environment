#!/usr/bin/env bash

# Check se o script esta rodando com root
if [[ "$(id -u)" != "0" ]]; then
   echo "This script must be run as root" 1>&2
   exit
fi

BASEDIR="$(cd "$(dirname "$0")" && pwd)"
UBUNTU_DIR="$(cd "$(dirname "$0")" && cd .. && pwd)"

bash "$BASEDIR/essentials.sh"
bash "$UBUNTU_DIR/install-cli.sh"
bash "$BASEDIR/shared-content.sh"