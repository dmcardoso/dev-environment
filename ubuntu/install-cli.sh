#!/usr/bin/env bash

if [[ "$(id -u)" != "0" ]]; then
   echo "This script must be run as root" 1>&2
   exit
fi

BASEDIR="$(cd "$(dirname "$0")" && pwd)"

function read_options() {
  local choice
  read -p "$1 $2?: [Y/N] " choice
  case $choice in
    Y) echo "y" ;;
    y) echo "y" ;;
    N) echo "n" ;;
    n) echo "n" ;;
    *) read_options $1 $2 ;;
  esac
}

function format_choice() {
  echo "$1=$2"
}

APPS=($@)
DEFINITIONS=(terminal_theme android_variables non_sudo_installer nvm zsh android_variables)
APP_NAMES=(draw_io docker telegram vscode discord notable android skype insomnia xtream obs woeusb dbeaver appimagelauncher zoom mongo xampp composer postgres cacher figma spotify gimp inkscape chrome bittorrent flameshot git virtualbox navicat screenruler zsh vlc unrar postman nvm phpstorm beekeeper bitwarden guvcview ffmpeg google_cloud notion-snap)

if [[ ${#APPS[@]} > 0 ]]; then
  APP_CHOICES=()
  DEFINITIONS_CHOICES=()

  INVALID_COUNT=0
  for APP in ${APPS[@]}; do
    if ! [[ " ${APP_NAMES[@]} " =~ " ${APP} " ]] && ! [[ " ${DEFINITIONS[@]} " =~ " ${APP} " ]]; then 
      echo "Parâmetro inválido: $APP"
      INVALID_COUNT=$((INVALID_COUNT+1))
    fi

    if [[ " ${APP_NAMES[@]} " =~ " ${APP} " ]]; then
      formatted_answer=$(format_choice "$APP" "y")
      APP_CHOICES+=("$formatted_answer")
    fi

    if [[ " ${DEFINITIONS[@]} " =~ " ${APP} " ]]; then
      formatted_answer=$(format_choice "$APP" "y")
      DEFINITIONS_CHOICES+=("$formatted_answer")
    fi
  done

  if [[ $INVALID_COUNT > 0 ]]; then
    echo "Aplicativos válidos:"
    printf '%s\n' "${APP_NAMES[@]}"
    printf '\n'
    echo "Customizações válidas:"
    printf '%s\n' "${DEFINITIONS[@]}"
    exit
  fi

  bash ${BASEDIR}/apps/apps.sh "${APP_CHOICES[*]}"
  bash ${BASEDIR}/user/customizations.sh "${DEFINITIONS_CHOICES[*]}"
else
  APP_CHOICES=()
  DEFINITIONS_CHOICES=()

  for APP in ${!APP_NAMES[@]}; do
    answer=$(read_options "Instalar" "${APP_NAMES[$APP]}")  
    formatted_answer=$(format_choice "${APP_NAMES[$APP]}" "$answer")
    APP_CHOICES+=("$formatted_answer")
  done

  for DEFINITION in ${!DEFINITIONS[@]}; do
    answer=$(read_options "Aplicar" "${DEFINITIONS[$DEFINITION]}")  
    formatted_answer=$(format_choice "${DEFINITIONS[$DEFINITION]}" "$answer")
    DEFINITIONS_CHOICES+=("$formatted_answer")
  done

  bash ${BASEDIR}/apps/apps.sh "${APP_CHOICES[*]}"
  bash ${BASEDIR}/user/customizations.sh "${DEFINITIONS_CHOICES[*]}"

  echo "Instalação finalizada!"
fi
