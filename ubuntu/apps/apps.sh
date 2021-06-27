#!/usr/bin/env bash

# Check se o script esta rodando com root
if [[ "$(id -u)" != "0" ]]; then
  echo "This script must be run as root" 1>&2
  exit
fi

BASEDIR="$(cd "$(dirname "$0")" && pwd)"
APP_CHOICES="$@"

source "$(cd $BASEDIR && cd .. && pwd)"/functions/steps.sh
source "$(cd $BASEDIR && cd .. && pwd)"/functions/choices.sh

## Java
if [[ $(find_choice "java") == "y" ]]; then
  begin_step "Installing java"
  bash ${BASEDIR}/java-11/java.sh
  end_step "java Installed"
fi

## Wine
if [[ $(find_choice "wine") == "y" ]]; then
  begin_step "Installing wine"
  bash ${BASEDIR}/wine/wine.sh
  end_step "wine Installed"
fi

## Xtream Downloader
if [[ $(find_choice "xtream") == "y" ]]; then
  begin_step "Installing xtream"
  apt install xdman-downloader -y
  end_step "xtream Installed"
fi

## Skype
if [[ $(find_choice "skype") == "y" ]]; then
  begin_step "Installing skype"
  snap install skype --classic
  end_step "skype Installed"
fi

## Cacher
if [[ $(find_choice "cacher") == "y" ]]; then
  begin_step "Installing cacher"
  snap install cacher
  end_step "cacher Installed"
fi

## Figma
if [[ $(find_choice "figma") == "y" ]]; then
  begin_step "Installing figma"
  snap install figma-linux
  end_step "figma Installed"
fi

## Telegram
if [[ $(find_choice "telegram") == "y" ]]; then
  begin_step "Installing telegram"
  snap install telegram-desktop
  end_step "telegram Installed"
fi

## VS Code
if [[ $(find_choice "vscode") == "y" ]]; then
  begin_step "Installing vscode"
  snap install code --classic
  end_step "vscode Installed"
fi

## Woeusb
if [[ $(find_choice "woeusb") == "y" ]]; then
  begin_step "Installing woeusb"
  bash ${BASEDIR}/woeusb/woeusb.sh
  end_step "woeusb Installed"
fi

## Discord
if [[ $(find_choice "discord") == "y" ]]; then
  begin_step "Installing discord"
  snap install discord
  end_step "discord Installed"
fi

## Draw.io
if [[ $(find_choice "draw_io") == "y" ]]; then
  begin_step "Installing draw_io"
    snap install drawio
    end_step "draw_io Installed"
fi

## PHP Storm
if [[ $(find_choice "phpstorm") == "y" ]]; then
  begin_step "Installing phpstorm"
    snap install phpstorm --classic
    end_step "phpstorm Installed"
fi

## Insomnia
if [[ $(find_choice "insomnia") == "y" ]]; then
  begin_step "Installing insomnia"
    snap install insomnia
    end_step "insomnia Installed"
fi

## OBS studio
if [[ $(find_choice "obs") == "y" ]]; then
  begin_step "Installing obs"
    snap install obs-studio
    end_step "obs Installed"
fi

## Zoom
if [[ $(find_choice "zoom") == "y" ]]; then
  begin_step "Installing zoom"
    snap install zoom-client
    end_step "zoom Installed"
fi

## Postgres
if [[ $(find_choice "postgres") == "y" ]]; then
  begin_step "Installing postgres"
    apt install postgresql postgresql-contrib -y
    end_step "postgres Installed"
fi

## Spotify
if [[ $(find_choice "spotify") == "y" ]]; then
  begin_step "Installing spotify"
  snap install spotify
  end_step "spotify Installed"
fi

## Gimp
if [[ $(find_choice "gimp") == "y" ]]; then
  begin_step "Installing gimp"
  snap install gimp
  end_step "gimp Installed"
fi

## Inkscape
if [[ $(find_choice "inkscape") == "y" ]]; then
  begin_step "Installing inkscape"
  snap install inkscape
  end_step "inkscape Installed"
fi

## Chrome
if [[ $(find_choice "chrome") == "y" ]]; then
  begin_step "Installing chrome"
  bash ${BASEDIR}/chrome/chrome.sh
  end_step "chrome Installed"
fi

## QBittorrent
if [[ $(find_choice "bittorrent") == "y" ]]; then
  begin_step "Installing bittorrent"
  apt install qbittorrent -y
  end_step "bittorrent Installed"
fi

## Flameshot Screenshot
if [[ $(find_choice "flameshot") == "y" ]]; then
  begin_step "Installing flameshot"
  apt install flameshot -y
  end_step "flameshot Installed"
fi

## App image launcher
if [[ $(find_choice "appimagelauncher") == "y" ]]; then
  begin_step "Installing appimagelauncher"
  wget https://github.com/TheAssassin/AppImageLauncher/releases/download/continuous/appimagelauncher-lite-2.1.0-travis896-d1be7e7-x86_64.AppImage -O appimagelauncher.deb
  end_step "appimagelauncher Installed"
  dpkg -i appimagelauncher.deb
  apt install -f
  rm -rf appimagelauncher.deb
fi

## Git
if [[ $(find_choice "git") == "y" ]]; then
  begin_step "Installing git"
  apt install git -y
  end_step "git Installed"
  git config --global credential.helper store
fi

## Virtualbox
if [[ $(find_choice "virtualbox") == "y" ]]; then
  begin_step "Installing virtualbox"
  apt install virtualbox -y
  end_step "virtualbox Installed"
  apt install virtualbox-ext-pack -y
fi

## MongoDB Compass
if [[ $(find_choice "mongo") == "y" ]]; then
  begin_step "Installing mongo"
  bash ${BASEDIR}/mongodb-compass/mongodb-compass.sh
  end_step "mongo Installed"
fi

## Navicat
if [[ $(find_choice "navicat") == "y" ]]; then
  begin_step "Installing navicat"
  bash ${BASEDIR}/navicat/navicat.sh
  end_step "navicat Installed"
fi

## Screen Ruler(Regua de pixel)
if [[ $(find_choice "screenruler") == "y" ]]; then
  begin_step "Installing screenruler"
  apt install screenruler -y
  end_step "screenruler Installed"
fi

## Zsh
if [[ $(find_choice "zsh") == "y" ]]; then
  begin_step "Installing zsh"
  apt install zsh -y
  end_step "zsh Installed"
  # Coloca zsh como shell principal
  chsh -s $(which zsh)
fi

## Docker
if [[ $(find_choice "docker") == "y" ]]; then
  begin_step "Installing docker"
  bash ${BASEDIR}/docker/docker.sh
  end_step "docker Installed"
fi

# VLC
if [[ $(find_choice "vlc") == "y" ]]; then
  begin_step "Installing vlc"
  apt install vlc -y
  end_step "vlc Installed"
fi

# Unrar
if [[ $(find_choice "unrar") == "y" ]]; then
  begin_step "Installing unrar"
  apt install unrar -y
  end_step "unrar Installed"
fi

# Postman
if [[ $(find_choice "postman") == "y" ]]; then
  begin_step "Installing postman"
  snap install postman
  end_step "postman Installed"
fi

## Xampp
if [[ $(find_choice "xampp") == "y" ]]; then
  begin_step "Installing xampp"
  bash ${BASEDIR}/xampp/xampp.sh
  end_step "xampp Installed"
fi

## Composer
if [[ $(find_choice "composer") == "y" ]]; then
  begin_step "Installing composer"
  bash ${BASEDIR}/composer/composer.sh
  end_step "composer Installed"
fi

## Notable
if [[ $(find_choice "notable") == "y" ]]; then
  begin_step "Installing notable"
  snap install notable --classic
  end_step "notable Installed"
fi

## Dbeaver
if [[ $(find_choice "dbeaver") == "y" ]]; then
  begin_step "Installing dbeaver"
  bash ${BASEDIR}/dbeaver/dbeaver.sh
  end_step "dbeaver Installed"
fi

## FFMpeg
if [[ $(find_choice "ffmpeg") == "y" ]]; then
  begin_step "Installing ffmpeg"
  bash ${BASEDIR}/ffmpeg/ffmpeg.sh
  end_step "ffmpeg Installed"
fi

## Google cloud sdk
if [[ $(find_choice "google_cloud") == "y" ]]; then
  begin_step "Installing google_cloud"
  snap install google-cloud-sdk --classic
  end_step "google_cloud Installed"
fi

## Notion
if [[ $(find_choice "notion-snap") == "y" ]]; then
  begin_step "Installing snap"
  snap install notion-snap
  end_step "snap Installed"
fi

## Android studio
if [[ $(find_choice "android") == "y" ]]; then
  begin_step "Installing android"
  snap install android-studio --classic
  end_step "android Installed"
fi

## BeeKeeper
if [[ $(find_choice "beekeeper") == "y" ]]; then
  begin_step "Installing beekeeper"
  snap install beekeeper-studio
  end_step "beekeeper Installed"
fi

## Bitwarden
if [[ $(find_choice "bitwarden") == "y" ]]; then
  begin_step "Installing bitwarden"
  sudo snap install bitwarden
  end_step "bitwarden Installed"
fi

## guvcview
if [[ $(find_choice "guvcview") == "y" ]]; then
  begin_step "Installing guvcview"
  sudo snap install guvcview
  end_step "guvcview Installed"
fi

## slack
if [[ $(find_choice "slack") == "y" ]]; then
  begin_step "Installing slack"
  snap install slack --classic
  end_step "slack Installed"
fi

## myki
if [[ $(find_choice "myki") == "y" ]]; then
  begin_step "Installing myki"
  bash ${BASEDIR}/myki/myki.sh
  end_step "myki Installed"
fi

## gh
if [[ $(find_choice "gh") == "y" ]]; then
  begin_step "Installing gh"
  bash ${BASEDIR}/gh/gh.sh
  end_step "gh Installed"
fi

## intelij
if [[ $(find_choice "intelij") == "y" ]]; then
  begin_step "Installing intelij"
  snap install intellij-idea-community --classic
  end_step "intelij Installed"
fi

## kubernetes
if [[ $(find_choice "kubernetes") == "y" ]]; then
  begin_step "Installing kubernetes"
  bash ${BASEDIR}/kubernetes/kubernetes.sh
  end_step "kubernetes Installed"
fi

## awscli
if [[ $(find_choice "awscli") == "y" ]]; then
  begin_step "Installing awscli"
  bash ${BASEDIR}/aws_cli/aws_cli.sh
  end_step "awscli Installed"
fi

## terminator
if [[ $(find_choice "terminator") == "y" ]]; then
  begin_step "Installing terminator"
  bash ${BASEDIR}/terminator/terminator.sh
  end_step "terminator Installed"
fi
