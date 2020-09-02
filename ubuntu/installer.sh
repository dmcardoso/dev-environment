#!/usr/bin/env bash

# Check se o script esta rodando com root
if [[ "$(id -u)" != "0" ]]; then
   echo "This script must be run as root" 1>&2
   exit
fi

BASEDIR="$(cd "$(dirname "$0")" && pwd)"

read -r -p "Instalar o docker? [y/N] " docker
read -r -p "Adicionar variáveis  do android? [y/N] " android_variables
read -r -p "Instalar draw.io? [y/N] " install_drawio
read -r -p "Instalar telegram? [y/N] " install_telegram
read -r -p "Instalar VSCode? [y/N] " install_vscode
read -r -p "Instalar discord? [y/N] " install_discord
read -r -p "Instalar jetbrains toolbox? [y/N] " jetbrains_toolbox
read -r -p "Instalar notable? [y/N] " notable
read -r -p "Instalar android studio? [y/N] " android_studio
read -r -p "Instalar php storm? [y/N] " install_phpstorm
read -r -p "Instalar skype? [y/N] " install_skype
read -r -p "Instalar insomnia? [y/N] " install_insomnia
read -r -p "Instalar Xtream Downloader? [y/N] " install_xtreamdownloader
read -r -p "Instalar OBS? [y/N] " install_obs
read -r -p "Instalar WOEUSB? [y/N] " install_woeusb
read -r -p "Instalar DBeaver? [y/N] " install_dbeaver
read -r -p "Instalar AppImageLauncher? [y/N] " install_appimagelauncher
read -r -p "Instalar Zoom? [y/N] " install_zoom
read -r -p "Instalar mongo? [y/N] " install_mongo_compass
read -r -p "Instalar xampp? [y/N] " install_xampp
read -r -p "Instalar composer? [y/N] " install_composer
read -r -p "Instalar postgres? [y/N] " install_postgres

# Adiciona repositórios
add-apt-repository ppa:linrunner/tlp -y
add-apt-repository multiverse -y

# Atualização de pacotes
apt update -y
apt upgrade -y

# Essencial
apt install tlp tlp-rdw -y

# Minhas Fonts
bash ${BASEDIR}/apps/fonts/fonts.sh

# Copia arquivos de modelos para a pasta do usuário
bash "$BASEDIR/models/models.sh"

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
bash ${BASEDIR}/apps/java-8/java.sh

## Xtream Downloader
if [[ "$install_xtreamdownloader" == "y" ]]; then
    apt install xdman-downloader -y
fi

## Skype
if [[ "$install_skype" == "y" ]]; then
    wget https://go.skype.com/skypeforlinux-64.deb
    apt install ./skypeforlinux-64.deb
    rm -rf ./skypeforlinux-64.deb
fi


## Cacher
snap install cacher

## Figma
snap install figma-linux

## Telegram
if [[ "$install_telegram" == "y" ]]; then
  snap install telegram-desktop
fi

## VS Code
if [[ "$install_vscode" == "y" ]]; then
  snap install code --classic
fi

## VS Code
if [[ "$install_woeusb" == "y" ]]; then
  bash ${BASEDIR}/apps/woeusb/woeusb.sh
fi

## Discord
if [[ "$install_discord" == "y" ]]; then
  snap install discord
fi

## Draw.io
if [[ "$install_drawio" == "y" ]]; then
    snap install drawio
fi

## PHP Storm
if [[ "$install_phpstorm" == "y" ]]; then
    snap install phpstorm --classic
fi

## Insomnia
if [[ "$install_insomnia" == "y" ]]; then
    snap install insomnia
fi

## OBS studio
if [[ "$install_obs" == "y" ]]; then
    snap install obs-studio
fi

## Zoom
if [[ "$install_zoom" == "y" ]]; then
    snap install zoom-client
fi

## Postgres
if [[ "$install_postgres" == "y" ]]; then
    apt install postgresql postgresql-contrib
fi

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

## App image launcher
if [[ "$install_appimagelauncher" == "y" ]]; then
  wget https://github.com/TheAssassin/AppImageLauncher/releases/download/continuous/appimagelauncher-lite-2.1.0-travis896-d1be7e7-x86_64.AppImage -O appimagelauncher.deb
  dpkg -i appimagelauncher.deb
  apt install -f
  rm -rf appimagelauncher.deb
fi

# Desenvolvimento

## Git
apt install git -y
git config --global credential.helper store

## Virtualbox
apt install virtualbox
apt install virtualbox-ext-pack

if [[ "$install_mongo_compass" == "y" ]]; then
    ## MongoDB Compass
    bash ${BASEDIR}/apps/mongodb-compass/mongodb-compass.sh
fi

## Navicat
bash ${BASEDIR}/apps/navicat/navicat.sh

## Screen Ruler(Regua de pixel)
apt install screenruler -y

## GPick(Seletor de cor)
apt install gpick -y

## Zsh
apt install zsh -y

# Coloca zsh como shell principal
chsh -s $(which zsh)

if [[ "$docker" == "y" ]]; then
  ## Docker
  apt install docker.io -y
  curl -L https://github.com/docker/compose/releases/download/1.25.5/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
  chmod +x /usr/local/bin/docker-compose
  systemctl enable docker
  groupadd docker
  usermod -aG docker $SUDO_USER
fi

# VLC
apt install vlc -y

# Unrar
apt install unrar -y

# Postman
snap install postman

## Drivers
bash ${BASEDIR}/apps/drivers/video.sh

if [[ "$install_xampp" == "y" ]]; then
    ## Xampp
    bash ${BASEDIR}/apps/xampp/xampp.sh
fi

if [[ "$install_composer" == "y" ]]; then
    ## Composer
    bash ${BASEDIR}/apps/composer/composer.sh
fi

if [[ "$jetbrains_toolbox" == "y" ]]; then
  ## Jetbrains toolbox
  bash ${BASEDIR}/apps/jetbrains-toolbox/jetbrains-toolbox.sh
fi

if [[ "$notable" == "y" ]]; then
  ## Jetbrains toolbox
  snap install notable --classic
fi

if [[ "$install_dbeaver" == "y" ]]; then
  ## Dbeaver
  snap install dbeaver-ce
fi

# Executa o script de configuração customizada com o usuário real
sudo -i -u ${SUDO_USER} bash "$BASEDIR/non-sudo-installer.sh" "$android_variables"

## Android studio
if [[ "$android_studio" == "y" ]]; then
    snap install android-studio --classic
fi

# Tema para o terminal
apt install dconf-cli -y

git clone https://github.com/dracula/gnome-terminal /opt/gnome-terminal
/opt/gnome-terminal/install.sh

echo "Instalação finalizada!"
