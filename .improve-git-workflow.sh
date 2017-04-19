#! /bin/bash

sudo apt-get update

sudo apt-get -y --no-install-recommends install curl gitg


## Install git flow
curl -OL https://raw.github.com/nvie/gitflow/develop/contrib/gitflow-installer.sh
chmod +x gitflow-installer.sh
sudo ./gitflow-installer.sh
sudo rm -rf gitflow
rm gitflow-installer.sh

## Setup gedit as commit editor
git config --global core.editor "gedit -s"

