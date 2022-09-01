#!/bin/bash

# 👉 Installer required packages
if ! [ -x "$(command -v curl)" ]; then
  sudo apt-get update && sudo apt-get install -y curl
fi

# 👉 check platform
hardware=`${sudo_cmd} cat /etc/nv_tegra_release 2> /dev/null | grep BOARD | sed "s/^.*BOARD:\\ //g" | sed "s/\\,.*$//g"`
if [ ! $? -eq 0 ] || [ "$hardware" == '' ]; then
  echo -e 'Failed to get Tegra Releace information'
  exit 1
fi

if [ "$hardware" == 't186ref' ];then
  # nx
  curl -o installer -sSL https://raw.githubusercontent.com/nilvana-ai/people-counting-installer/main/nx && chmod 0755 installer
elif [ "$hardware" == 't210ref' ]; then
  # nano
  curl -o installer -sSL https://raw.githubusercontent.com/nilvana-ai/people-counting-installer/main/nano && chmod 0755 installer
else
  echo -e 'Unsupported platform!'
  exit 1
fi

# 👉 Install
./installer