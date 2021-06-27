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
source "$(cd $BASEDIR && cd .. && pwd)"/functions/steps.sh

begin_step "Adding dotfiles"
# Copia arquivos de configuração para a pasta do usuário
bash "$UBUNTU_DIR/dotfiles/dotfiles.sh"
end_step "dotfiles Added"

## Node version manager
if [[ "$install_nvm" == "y" ]]; then
  begin_step "Installing nvm"
  bash "$UBUNTU_DIR/nvm/nvm.sh"
  end_step "nvm Installed"
fi

## Instala oh my zsh
if [[ "$install_zsh" == "y" ]]; then
  begin_step "Installing zsh"
  bash "$UBUNTU_DIR/apps/zsh/zsh.sh"
  end_step "zsh Installed"
fi

# Adiciona variáveis do android para o zsh
if [[ "$android_variables" == "y" ]]; then
  begin_step "Adding android variables"
  echo -e "export ANDROID_HOME=\$HOME/Android/Sdk
export ANDROID_SDK=\$ANDROID_HOME
export PATH=\$PATH:\$ANDROID_HOME/emulator
export PATH=\$PATH:\$ANDROID_HOME/tools
export PATH=\$PATH:\$ANDROID_HOME/tools/bin
export PATH=\$PATH:\$ANDROID_HOME/platform-tools" >> /home/$USER/.zshrc
  end_step "android variables Added"
fi
