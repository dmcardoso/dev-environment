#!/usr/bin/env bash

# Check se o script esta rodando com root
if [[ "$(id -u)" != "0" ]]; then
   echo "This script must be run as root" 1>&2
   exit
fi

BASEDIR="$(cd "$(dirname "$0")" && pwd)"

wget -cO jetbrains-toolbox.tar.gz "https://data.services.jetbrains.com/products/download?platform=linux&code=TBA"
tar -xzf jetbrains-toolbox.tar.gz

DIR=$(find . -maxdepth 1 -type d -name jetbrains-toolbox-\* -print | head -n1)

cd $DIR
./jetbrains-toolbox
cd $BASEDIR

rm -r $DIR
rm jetbrains-toolbox.tar.gz