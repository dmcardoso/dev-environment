#!/usr/bin/env bash

# Check se o script esta rodando com root
if [[ "$(id -u)" != "0" ]]; then
  echo "This script must be run as root" 1>&2
  exit
fi

BASEDIR="$(cd "$(dirname "$0")" && pwd)"
UBUNTU_DIR="$(cd "$(dirname "$0")" && cd .. && pwd)"

source $UBUNTU_DIR/functions/steps.sh

begin_step "Adding repositories"
# Adiciona repositórios
add-apt-repository ppa:linrunner/tlp -y
add-apt-repository multiverse -y
end_step "repositories Added"

begin_step "Updating packages"
# Atualização de pacotes
apt update -y
apt upgrade -y
end_step "packages updated"

# Essencial
apt install tlp tlp-rdw -y
tlp start

begin_step "Adding fonts"
# Minhas Fonts
bash "${UBUNTU_DIR}/fonts/fonts.sh"
end_step "fonts Added"

begin_step "Adding model files"
# Copia arquivos de modelos para a pasta do usuário
bash "$UBUNTU_DIR/models/models.sh"
end_step "model files Added"

begin_step "Installing curl"
## Curl
apt install curl -y
end_step "curl Installed"

begin_step "Installing python utils"
## Dependências python
apt install python-software-properties python3-pip -y
end_step "python utils Installed"

# Recursos sistemas

begin_step "Installing jq"
# JQ
apt install jq -y
end_step "jq Installed"

begin_step "Installing alacarte"
## Menu Principal(Organizado de menus)
apt install alacarte -y
end_step "alacarte Installed"

begin_step "Installing gparted"
## GParted
apt install gparted -y
end_step "gparted Installed"

begin_step "Installing lxqt"
## lxqt
apt install lxqt -y
end_step "lxqt Installed"

begin_step "Installing flatpak"
# Gerenciador de pacotes latpak
apt install flatpak -y
end_step "flatpak Installed"

begin_step "Installing gnome extensions"
# Extensões GNOME
apt install x11-utils -y
apt install gnome-tweaks -y
apt install chrome-gnome-shell -y
end_step "gnome extensions Installed"

begin_step "Installing snapd"
## Snap
apt install snapd -y
end_step "snapd Installed"

begin_step "Installing vim"
## Editor de texto Vim
apt install vim -y
end_step "vim Installed"

begin_step "Installing video drivers"
## Drivers
bash ${UBUNTU_DIR}/apps/drivers/video.sh
end_step "video drivers Installed"
