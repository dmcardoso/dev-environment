#!/usr/bin/env bash

if [[ "$(id -u)" == "0" ]]; then
   echo "This script must be run as normal user" 1>&2
   exit
fi

android_variables=$1
install_zsh=$2
install_nvm=$3

BASEDIR="$(cd "$(dirname "$0")" && pwd)"
UBUNTU_DIR="$(cd "$(dirname "$0")" && cd .. && pwd)"

# Copia arquivos de configuração para a pasta do usuário
bash "$UBUNTU_DIR/dotfiles/dotfiles.sh"

## Node version manager
if [[ "$install_nvm" == "y" ]]; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
fi

## Instala oh my zsh
if [[ "$install_zsh" == "y" ]]; then
    bash "$UBUNTU_DIR/apps/zsh/zsh.sh" "$install_nvm"
fi

# Adiciona variáveis do android para o zsh
if [[ "$android_variables" == "y" ]]; then
    echo -e "export ANDROID_HOME=\$HOME/Android/Sdk
export ANDROID_SDK=\$ANDROID_HOME
export PATH=\$PATH:\$ANDROID_HOME/emulator
export PATH=\$PATH:\$ANDROID_HOME/tools
export PATH=\$PATH:\$ANDROID_HOME/tools/bin
export PATH=\$PATH:\$ANDROID_HOME/platform-tools" >> /home/$USER/.zshrc
fi

nautilus /home/$USER/Downloads