#!/usr/bin/env bash

# Check se o script esta rodando com root
if [[ "$(id -u)" != "0" ]]; then
   echo "This script must be run as root" 1>&2
   exit
fi

BASEDIR=$(dirname "$0")

# Download
wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1iHXlFCh7lVghs4Qj7HHPL6JiN7odxJy1' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1iHXlFCh7lVghs4Qj7HHPL6JiN7odxJy1" -O /home/$USER/Downloads/navicat.zip && rm -rf /tmp/cookies.txt
