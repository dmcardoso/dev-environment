#!/usr/bin/env bash

if [[ "$(id -u)" == "0" ]]; then
   echo "This script must be run as normal user" 1>&2
   exit
fi

BASEDIR="$(cd "$(dirname "$0")" && pwd)"

## Node version manager
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.0/install.sh | bash

## Instala oh my zsh
bash "$BASEDIR/apps/zsh/zsh.sh"