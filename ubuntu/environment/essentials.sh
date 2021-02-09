#!/usr/bin/env bash

# Check se o script esta rodando com root
if [[ "$(id -u)" != "0" ]]; then
   echo "This script must be run as root" 1>&2
   exit
fi

BASEDIR="$(cd "$(dirname "$0")" && pwd)"
UBUNTU_DIR="$(cd "$(dirname "$0")" && cd .. && pwd)"

# Adiciona repositórios
add-apt-repository ppa:linrunner/tlp -y
add-apt-repository multiverse -y

# Atualização de pacotes
apt update -y
apt upgrade -y

# Essencial
apt install tlp tlp-rdw -y
tlp start

# Minhas Fonts
bash "${UBUNTU_DIR}/fonts/fonts.sh"

# Copia arquivos de modelos para a pasta do usuário
bash "$UBUNTU_DIR/models/models.sh"

## Curl
apt install curl -y

## Dependências python
apt install python-software-properties -y

# Recursos sistemas

## Menu Principal(Organizado de menus)
apt install alacarte -y

## GParted
apt install gparted -y

## lxqt
apt install lxqt -y

# Gerenciador de pacotes latpak
apt install flatpak -y

# Extensões GNOME
apt install x11-utils -y
apt install gnome-tweaks -y
apt install chrome-gnome-shell -y

## Wine HQ
dpkg --add-architecture i386
wget -nc https://dl.winehq.org/wine-builds/winehq.key
apt-key add winehq.key
apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ disco main' -y
apt update -y
apt install --install-recommends winehq-stable -y

## Snap
apt install snapd -y

## Java
bash ${UBUNTU_DIR}/apps/java-8/java.sh

## Editor de texto Vim
apt install vim -y

## Drivers
bash ${UBUNTU_DIR}/apps/drivers/video.sh
