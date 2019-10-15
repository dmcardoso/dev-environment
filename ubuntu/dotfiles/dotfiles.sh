#!/usr/bin/env bash

BASEDIR="$(cd "$(dirname "$0")" && pwd)"

cp ${BASEDIR}/assets/* /home/$USER
cp ${BASEDIR}/assets/.* /home/$USER
