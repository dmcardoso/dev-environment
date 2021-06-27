#!/usr/bin/env bash

# Check se o script esta rodando com root
if [[ "$(id -u)" != "0" ]]; then
  echo "This script must be run as root" 1>&2
  exit
fi

echo "Adding NVM_DIR to /home/$SUDO_USER/.zshrc"
echo -e "
export NVM_DIR="$HOME/.nvm"
  [ -s "\$NVM_DIR/nvm.sh" ] && \. "\$NVM_DIR/nvm.sh"  # This loads nvm" >> /home/$SUDO_USER/.zshrc


echo "Adding node plugins to /home/$SUDO_USER/.zshrc"
sed -Ei "s/^(plugins=\((.*)\))/plugins=(\2 node npm nvm yarn npx)/g" /home/$SUDO_USER/.zshrc