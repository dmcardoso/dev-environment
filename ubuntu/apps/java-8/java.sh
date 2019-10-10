#!/usr/bin/env bash

# Check se o script esta rodando com root
if [[ "$(id -u)" != "0" ]]; then
   echo "This script must be run as root" 1>&2
   exit
fi

BASEDIR=$(dirname "$0")

# Download Java
## Exemplos de download de arquivos publicos do google drive
## https://gist.github.com/tanaikech/f0f2d122e05bf5f971611258c22c110f
fileid="1Rhl_UbfJbX2iEUA6g5kA5Cwk9ZPpyudB"
filename="/tmp/java8.tar.gz"

curl -c /tmp/cookie.txt -s -L "https://drive.google.com/uc?export=download&id=${fileid}" > /dev/null
curl -Lb /tmp/cookie.txt "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' /tmp/cookie.txt`&id=${fileid}" -o ${filename}

# Extrai java
tar -zvxf /tmp/java8.tar.gz -C /tmp
mkdir -p /usr/lib/jvm/
mv /tmp/jdk1.8.0_211 /usr/lib/jvm/jdk1.8.0_211

# Bash para declarar variaveis
cp ${BASEDIR}/assets/oracle-java-8.sh /etc/profile.d/oracle-java-8.sh
