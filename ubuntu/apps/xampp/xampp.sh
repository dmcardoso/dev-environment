#!/usr/bin/env bash

# Check se o script esta rodando com root
if [[ "$(id -u)" != "0" ]]; then
   echo "This script must be run as root" 1>&2
   exit
fi

BASEDIR=$(dirname "$0")

# Download e instalação
wget "https://ufpr.dl.sourceforge.net/project/xampp/XAMPP%20Linux/7.3.10/xampp-linux-x64-7.3.10-0-installer.run" -O xampp-installer.run
chmod +x xampp-installer.run
./xampp-installer.run
rm -f ./xampp-installer.run

cat > $USER/.local/share/applications/xampp.desktop <<EOL
[Desktop Entry]
Version=1.0
Encoding=UTF-8
Name=XAMPP Control Panel
Comment=Start and Stop XAMPP
Exec=lxqt-sudo /opt/lampp/manager-linux-x64.run
Icon=/opt/lampp/htdocs/favicon.ico
Type=Application
Terminal=true
Categories=Development;
EOL

chmod +x /usr/share/applications/xampp.desktop
chmod +x $USER/.local/share/applications/xampp.desktop

# Links de acesso
ln -s /opt/lampp/bin/mysql /usr/local/bin/mysql
ln -s /opt/lampp/bin/mysqldump /usr/local/bin/mysqldump
ln -s /opt/lampp/bin/php /usr/local/bin/php
ln -s /otp/lampp/lampp /usr/local/bin/lampp

# Permissões
chmod -R 755 /opt/lampp/htdocs
chown -R $USER:$USER /opt/lampp/htdocs

sed -i "s/User daemon/User "$USER"/g" /opt/lampp/etc/httpd.conf
sed -i "s/Group daemon/Group "$USER"/g" /opt/lampp/etc/httpd.conf