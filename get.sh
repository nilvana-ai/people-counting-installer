#!/bin/bash

# 👉 Installer required packages
if ! [ -x "$(command -v curl)" ]; then
  sudo apt-get update && sudo apt-get install -y curl
fi

curl -o installer -sSL https://raw.githubusercontent.com/nilvana-ai/people-counting-installer/main/installer && chmod 0755 installer

# 👉 Install
./installer