#!/usr/bin/env bash

# Check se o script esta rodando com root
if [[ "$(id -u)" != "0" ]]; then
   echo "This script must be run as root" 1>&2
   exit
fi

BASEDIR=$(dirname "$0")

add-apt-repository ppa:mc3man/trusty-media  
apt update  
apt install ffmpeg  
apt install frei0r-plugins  
