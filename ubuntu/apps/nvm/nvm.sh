#!/usr/bin/env bash

if [[ "$(id -u)" == "0" ]]; then
  echo "This script must be run as normal user" 1>&2
  exit
fi

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash