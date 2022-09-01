#!/bin/bash

sudo apt-get update && sudo apt-get install -y curl
curl -o installer -sSL https://raw.githubusercontent.com/nilvana-ai/people-counting-installer/main/installer && chmod 0755 installer
sudo ./installer