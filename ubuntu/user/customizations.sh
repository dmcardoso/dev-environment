#!/usr/bin/env bash

if [[ "$(id -u)" != "0" ]]; then
   echo "This script must be run as root" 1>&2
   exit
fi

BASEDIR="$(cd "$(dirname "$0")" && pwd)"
APP_CHOICES="$@"

function find_choice() {
  CHOICES=($APP_CHOICES)

  for answer in ${!CHOICES[@]}; do
    CHOICE_NAME="$(cut -d'=' -f1 <<<"${CHOICES[$answer]}")"
    CHOICE_ANSWER="$(cut -d'=' -f2 <<<"${CHOICES[$answer]}")"

    if [ $CHOICE_NAME == $1 ]; then
      echo $CHOICE_ANSWER
      return
    fi
  done

  echo "n"
  return
}

# Tema para o terminal
if [[ $(find_choice "terminal_theme") == "y" ]]; then
  apt install dconf-cli -y
  git clone https://github.com/dracula/gnome-terminal /opt/gnome-terminal
  /opt/gnome-terminal/install.sh
fi

# Executa o script de configuração customizada com o usuário real
if [[ $(find_choice "non_sudo_installer") == "y" ]]; then
  sudo -i -u ${SUDO_USER} bash "$BASEDIR/non-sudo-installer.sh" $(find_choice "android_variables") $(find_choice "zsh") $(find_choice "nvm")
fi
