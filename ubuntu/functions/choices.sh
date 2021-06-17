#!/usr/bin/env bash

function find_choice() {
  CHOICES=($APP_CHOICES)

  for answer in ${!CHOICES[@]}; do
    CHOICE_NAME="$(cut -d'=' -f1 <<<"${CHOICES[$answer]}")"
    CHOICE_ANSWER="$(cut -d'=' -f2 <<<"${CHOICES[$answer]}")"

    if [ $CHOICE_NAME == $1 ]; then
      echo $CHOICE_ANSWER
      return
    fi
  done

  echo "n"
  return
}