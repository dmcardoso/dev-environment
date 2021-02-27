#!/usr/bin/env bash

if [[ "$(id -u)" != "0" ]]; then
   echo "This script must be run as root" 1>&2
   exit
fi

BASEDIR="$(cd "$(dirname "$0")" && pwd)"

gcloud init

gcloud auth login

gcloud auth list

gcloud auth application-default login

gcloud auth configure-docker

gcloud components update

# (Y)
gcloud components install kubectl alpha beta cloud_sql_proxy

# check kubectl alpha beta cloud_sql_proxy
gcloud components list
