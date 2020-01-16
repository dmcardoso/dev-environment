#!/usr/bin/env bash

BASEDIR=$(dirname "$0")

# Copiar Modelos
cp -r ${BASEDIR}/assets/* /home/$USER/Modelos
chown -R ${SUDO_USER}:${SUDO_USER} /home/$SUDO_USER/Modelos
