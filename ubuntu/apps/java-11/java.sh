#!/usr/bin/env bash

# Check se o script esta rodando com root
if [[ "$(id -u)" != "0" ]]; then
   echo "This script must be run as root" 1>&2
   exit
fi

BASEDIR=$(dirname "$0")

## Java 8 sdk
apt install openjdk-11-jdk -y

# Libs gráficas 32 bits para o ubuntu
apt install gcc-multilib lib32z1 lib32stdc++6 -y

echo -e "export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
export PATH=\$PATH:\$JAVA_HOME/bin" >> /home/$SUDO_USER/.bash_profile