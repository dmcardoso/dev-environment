#!/usr/bin/env bash

# Check se o script esta rodando com root
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

## Xtream Downloader
if [[ $(find_choice "xtream") == "y" ]]; then
  apt install xdman-downloader -y
fi

## Skype
if [[ $(find_choice "skype") == "y" ]]; then
  snap install skype --classic
fi

## Cacher
if [[ $(find_choice "cacher") == "y" ]]; then
  snap install cacher
fi

## Figma
if [[ $(find_choice "figma") == "y" ]]; then
  snap install figma-linux
fi

## Telegram
if [[ $(find_choice "telegram") == "y" ]]; then
  snap install telegram-desktop
fi

## VS Code
if [[ $(find_choice "vscode") == "y" ]]; then
  snap install code --classic
fi

## Woeusb
if [[ $(find_choice "woeusb") == "y" ]]; then
  bash ${BASEDIR}/woeusb/woeusb.sh
fi

## Discord
if [[ $(find_choice "discord") == "y" ]]; then
  snap install discord
fi

## Draw.io
if [[ $(find_choice "draw_io") == "y" ]]; then
    snap install drawio
fi

## PHP Storm
if [[ $(find_choice "phpstorm") == "y" ]]; then
    snap install phpstorm --classic
fi

## Insomnia
if [[ $(find_choice "insomnia") == "y" ]]; then
    snap install insomnia
fi

## OBS studio
if [[ $(find_choice "obs") == "y" ]]; then
    snap install obs-studio
fi

## Zoom
if [[ $(find_choice "zoom") == "y" ]]; then
    snap install zoom-client
fi

## Postgres
if [[ $(find_choice "postgres") == "y" ]]; then
    apt install postgresql postgresql-contrib -y
fi

## Spotify
if [[ $(find_choice "spotify") == "y" ]]; then
  snap install spotify
fi

## Gimp
if [[ $(find_choice "gimp") == "y" ]]; then
  snap install gimp
fi

## Inkscape
if [[ $(find_choice "inkscape") == "y" ]]; then
  snap install inkscape
fi

## Chrome
if [[ $(find_choice "chrome") == "y" ]]; then
  bash ${BASEDIR}/chrome/chrome.sh
fi

## QBittorrent
if [[ $(find_choice "bittorrent") == "y" ]]; then
  apt install qbittorrent -y
fi

## Flameshot Screenshot
if [[ $(find_choice "flameshot") == "y" ]]; then
  apt install flameshot -y
fi

## App image launcher
if [[ $(find_choice "appimagelauncher") == "y" ]]; then
  wget https://github.com/TheAssassin/AppImageLauncher/releases/download/continuous/appimagelauncher-lite-2.1.0-travis896-d1be7e7-x86_64.AppImage -O appimagelauncher.deb
  dpkg -i appimagelauncher.deb
  apt install -f
  rm -rf appimagelauncher.deb
fi

## Git
if [[ $(find_choice "git") == "y" ]]; then
  apt install git -y
  git config --global credential.helper store
fi

## Virtualbox
if [[ $(find_choice "virtualbox") == "y" ]]; then
  apt install virtualbox -y
  apt install virtualbox-ext-pack -y
fi

## MongoDB Compass
if [[ $(find_choice "mongo") == "y" ]]; then
  bash ${BASEDIR}/mongodb-compass/mongodb-compass.sh
fi

## Navicat
if [[ $(find_choice "navicat") == "y" ]]; then
  bash ${BASEDIR}/navicat/navicat.sh
fi

## Screen Ruler(Regua de pixel)
if [[ $(find_choice "screenruler") == "y" ]]; then
  apt install screenruler -y
fi

## Zsh
if [[ $(find_choice "zsh") == "y" ]]; then
  apt install zsh -y
  # Coloca zsh como shell principal
  chsh -s $(which zsh)
fi

## Docker
if [[ $(find_choice "docker") == "y" ]]; then
  apt install docker.io -y
  curl -L https://github.com/docker/compose/releases/download/1.25.5/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
  chmod +x /usr/local/bin/docker-compose
  systemctl enable docker
  groupadd docker
  usermod -aG docker $SUDO_USER
fi

# VLC
if [[ $(find_choice "vlc") == "y" ]]; then
  apt install vlc -y
fi

# Unrar
if [[ $(find_choice "unrar") == "y" ]]; then
  apt install unrar -y
fi

# Postman
if [[ $(find_choice "postman") == "y" ]]; then
  snap install postman
fi

## Xampp
if [[ $(find_choice "xampp") == "y" ]]; then
  bash ${BASEDIR}/xampp/xampp.sh
fi

## Composer
if [[ $(find_choice "composer") == "y" ]]; then
  bash ${BASEDIR}/composer/composer.sh
fi

## Notable
if [[ $(find_choice "notable") == "y" ]]; then
  snap install notable --classic
fi

## Dbeaver
if [[ $(find_choice "dbeaver") == "y" ]]; then
  bash ${BASEDIR}/dbeaver/dbeaver.sh
fi

## Android studio
if [[ $(find_choice "android") == "y" ]]; then
  snap install android-studio --classic
fi

## BeeKeeper
if [[ $(find_choice "beekeeper") == "y" ]]; then
  snap install beekeeper-studio
fi

## Bitwarden
if [[ $(find_choice "bitwarden") == "y" ]]; then
  sudo snap install bitwarden
fi

## guvcview
if [[ $(find_choice "guvcview") == "y" ]]; then
  sudo snap install guvcview
fi
