#!/usr/bin/env bash

mkdir /home/$USER/android/sdk

wget "https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip" /home/$USER/android/sdk/sdk-tools-linux-4333796.zip

unzip /home/$USER/android/sdk/sdk-tools-linux-4333796.zip

rm -rf /home/$USER/android/sdk/sdk-tools-linux-4333796.zip

