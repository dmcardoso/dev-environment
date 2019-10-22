#!/usr/bin/env bash

if [[ "$(id -u)" == "0" ]]; then
   echo "This script must be run as normal user" 1>&2
   exit
fi

android_variables=$1

BASEDIR="$(cd "$(dirname "$0")" && pwd)"

## Node version manager
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.0/install.sh | bash

## Instala oh my zsh
bash "$BASEDIR/apps/zsh/zsh.sh"

# Copia arquivos de configuração para a pasta do usuário
bash "$BASEDIR/dotfiles/dotfiles.sh"

# Adiciona variáveis do android para o zsh
if [[ "$android_variables" == "y" ]]; then
    echo -e "export ANDROID_HOME=\$HOME/Android/Sdk
export ANDROID_SDK=\$ANDROID_HOME
export PATH=\$PATH:\$ANDROID_HOME/emulator
export PATH=\$PATH:\$ANDROID_HOME/tools
export PATH=\$PATH:\$ANDROID_HOME/tools/bin
export PATH=\$PATH:\$ANDROID_HOME/platform-tools" >> /home/$USER/.zshrc
fi