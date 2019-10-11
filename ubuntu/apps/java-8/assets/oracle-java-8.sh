#!/usr/bin/env bash

path_variable=PATH
android_variable=ANDROID_HOME
java_home_variable=JAVA_HOME

echo -e "export ANDROID_HOME=~/android/sdk
export JAVA_HOME=/usr/lib/jvm/jdk1.8.0_211/bin
export PATH=$"$path_variable":$"$android_variable"/tools
export PATH=$"$path_variable":$"java_home_variable"
export PATH=$"$path_variable"Z:$"$android_variable"/platform-tools" >> /home/$USER/.bash_profile

