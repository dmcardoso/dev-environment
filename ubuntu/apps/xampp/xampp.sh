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

echo -e "[Desktop Entry]\n
Version=1.0\n
Encoding=UTF-8\n
Name=XAMPP Control Panel\n
Comment=Start and Stop XAMPP\n
Exec=lxqt-sudo /opt/lampp/manager-linux-x64.run\n
Icon=/opt/lampp/htdocs/favicon.ico\n
Type=Application\n
Terminal=true\n
Categories=Development;\n" >> /home/$USER/.local/share/applications/xampp.desktop

chmod +x /usr/share/applications/xampp.desktop
chmod +x $USER/.local/share/applications/xampp.desktop

# Links de acesso
ln -s /opt/lampp/bin/mysql /usr/local/bin/mysql
ln -s /opt/lampp/bin/mysqldump /usr/local/bin/mysqldump
ln -s /opt/lampp/bin/mysql_upgrade /usr/local/bin/mysql_upgrade
ln -s /opt/lampp/bin/mysqlcheck /usr/local/bin/mysqlcheck
ln -s /opt/lampp/bin/php /usr/local/bin/php
ln -s /otp/lampp/lampp /usr/local/bin/lampp

# Permissões
chmod -R 755 /opt/lampp/htdocs
chown -R $SUDO_USER:$SUDO_USER /opt/lampp/htdocs

sed -i "s/User daemon/User "$SUDO_USER"/g" /opt/lampp/etc/httpd.conf
sed -i "s/Group daemon/Group "$SUDO_USER"/g" /opt/lampp/etc/httpd.conf

# Cria atalho para o htdocs do xampp na home do usuário
ln -s /opt/lampp/htdocs /home/$USER/xampp-htdocs
