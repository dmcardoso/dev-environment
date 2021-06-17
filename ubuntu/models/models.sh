#!/usr/bin/env bash

BASEDIR=$(dirname "$0")

# Copiar Modelos
mkdir -p /home/$SUDO_USER/Modelos
cp -r ${BASEDIR}/assets/* /home/$SUDO_USER/Modelos
chown -R ${SUDO_USER}:${SUDO_USER} /home/$SUDO_USER/Modelos
