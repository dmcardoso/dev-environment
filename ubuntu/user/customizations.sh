#!/usr/bin/env bash

if [[ "$(id -u)" != "0" ]]; then
  echo "This script must be run as root" 1>&2
  exit
fi

BASEDIR="$(cd "$(dirname "$0")" && pwd)"
UBUNTU_DIR="$(cd "$(dirname "$0")" && cd .. && pwd)"
APP_CHOICES="$@"

source "$(cd $BASEDIR && cd .. && pwd)"/functions/steps.sh
source "$(cd $BASEDIR && cd .. && pwd)"/functions/choices.sh

# Tema para o terminal
if [[ $(find_choice "terminal_theme") == "y" ]]; then
  begin_step "Installing therminal theme"
  apt install dconf-cli -y
  git clone https://github.com/dracula/gnome-terminal /opt/gnome-terminal
  /opt/gnome-terminal/install.sh
  end_step "therminal theme Installed"
fi

# Executa o script de configuração customizada com o usuário real
if [[ $(find_choice "non_sudo_installer") == "y" ]]; then
  sudo -i -u ${SUDO_USER} bash "$BASEDIR/non-sudo-installer.sh" $(find_choice "android_variables") $(find_choice "zsh") $(find_choice "nvm")
fi

# Configurações do zsh para docker
if [[ $(find_choice "zsh") == "y" ]] && [[ $(find_choice "docker") == "y" ]]; then
  bash ${BASEDIR}/docker/docker_zsh.sh
fi

# Configurações do zsh para kubernetes
if [[ $(find_choice "zsh") == "y" ]] && [[ $(find_choice "kubernetes") == "y" ]]; then
  bash ${BASEDIR}/kubernetes/kubernetes_zsh.sh
fi

# Configurações do zsh para aws cli
if [[ $(find_choice "zsh") == "y" ]] && [[ $(find_choice "awscli") == "y" ]]; then
  bash ${BASEDIR}/aws_cli/aws_cli_zsh.sh
fi

# Configurações do zsh para aws cli
if [[ $(find_choice "zsh") == "y" ]] && [[ $(find_choice "nvm") == "y" ]]; then
  bash ${BASEDIR}/nvm/nvm_zsh.sh
fi
