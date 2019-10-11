#!/usr/bin/env bash

# Check se o script esta rodando com root
if [[ "$(id -u)" != "0" ]]; then
   echo "This script must be run as root" 1>&2
   exit
fi

BASEDIR=$(dirname "$0")

## Java 8 sdk
add-apt-repository ppa:openjdk-r/ppa
apt-get update
apt-get install openjdk-8-jdk

# Libs gráficas 32 bits para o ubuntu
apt-get install gcc-multilib lib32z1 lib32stdc++6

bash ${BASEDIR}/assets/android-sdk.sh
bash ${BASEDIR}/assets/oracle-java-8.sh
