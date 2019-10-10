#!/usr/bin/env bash

# Check se o script esta rodando com root
if [[ "$(id -u)" != "0" ]]; then
   echo "This script must be run as root" 1>&2
   exit
fi

BASEDIR=$(dirname "$0")

# Download e instalação
wget "https://www.apachefriends.org/xampp-files/7.3.10/xampp-linux-x64-7.3.10-0-installer.run" -O /tmp/xampp.run
chmod +x /tmp/xampp.run
/tmp/xampp.run
rm -f /tmp/xampp.run

# Inicializar junto ao sistema
cp ${BASEDIR}/assets/lampp /etc/init.d/lampp
chmod +x /etc/init.d/lampp
update-rc.d lampp defaults

# Links de acesso
ln -s /opt/lampp/bin/mysql /usr/local/bin/mysql
ln -s /opt/lampp/bin/mysqldump /usr/local/bin/mysqldump
ln -s /opt/lampp/bin/php /usr/local/bin/php

# Icone de inicialização
cp ${BASEDIR}/assets/favicon.ico /opt/lampp/favicon.ico
cp ${BASEDIR}/assets/xampp.desktop /usr/share/applications/xampp.desktop
