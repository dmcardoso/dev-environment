#!/usr/bin/env bash

# Check se o script esta rodando com root
if [[ "$(id -u)" != "0" ]]; then
   echo "This script must be run as root" 1>&2
   exit
fi

BASEDIR="$(cd "$(dirname "$0")" && pwd)"

read -r -p "Instalar o docker? [y/N] " docker

# Atualização de pacotes
apt update -y
apt upgrade -y

# Essencial

# Minhas Fonts
bash ${BASEDIR}/apps/fonts/fonts.sh

## Curl
apt install curl -y

## Dependências python
apt install python-software-properties -y

# Recursos sistemas

## Menu Principal(Organizado de menus)
apt install alacarte -y

## GParted
apt install gparted -y

## gksudo
apt install gksudo -y

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
apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ disco main'
apt update -y
apt install --install-recommends winehq-stable -y

## Snap
sudo apt install snapd -y

## Java
bash ${BASEDIR}/apps/java-8/java.sh

## Simplenote
snap install simplenote

## Spotify
snap install spotify

## Gimp
snap install gimp

## Inkscape
snap install inkscape

## Chrome
bash ${BASEDIR}/apps/chrome/chrome.sh

## QBittorrent
apt install qbittorrent -y

## Editor de texto Vim
apt install vim -y

## Flameshot Screenshot
apt install flameshot -y
## Release printscree key
gsettings set org.gnome.settings-daemon.plugins.media-keys screenshot ''
## Set new custom binding
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']"
## Set name
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'flameshot'
## Set command
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command '/usr/bin/flameshot gui'
## Set binding
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding 'Print'

# Desenvolvimento

## Git
apt install git -y
git config --global credential.helper store

## Filezilla
apt install filezilla -y

## Navicat
bash ${BASEDIR}/apps/navicat/navicat.sh

## Screen Ruler(Regua de pixel)
apt install screenruler -y

## GPick(Seletor de cor)
apt install gpick -y

## Zsh
sudp apt install zsh -y

if [[ "$docker" == "y" ]]; then
  ## Docker
  apt install docker.io -y
  curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  chmod +x /usr/local/bin/docker-compose
  systemctl enable docker
  groupadd docker
  usermod -aG docker $SUDO_USER
fi

# Genymotion
bash ${BASEDIR}/apps/genymotion/genymotion.sh

## Xampp
bash ${BASEDIR}/apps/xampp/xampp.sh

## Composer
bash ${BASEDIR}/apps/composer/composer.sh

# VLC
sudo apt-get install vlc -y

# Unrar
sudo apt install unrar -y

## Drivers
bash ${BASEDIR}/apps/drivers/video.sh

## Postman
snap install postman
