#! /bin/bash

sudo apt-get update

sudo apt-get -y --no-install-recommends install curl gitg gitk


## Install git flow
curl -OL https://raw.github.com/nvie/gitflow/develop/contrib/gitflow-installer.sh
chmod +x gitflow-installer.sh
sudo ./gitflow-installer.sh
sudo rm -rf gitflow
rm gitflow-installer.sh

## Setup gedit as commit editor
git config --global core.editor "gedit -s"

## Add alias to show branch description
## http://stackoverflow.com/a/39867674/2089695
git config --global --add alias.about '!describe() { git config branch."$(git symbolic-ref --short -q HEAD)".description; }; describe'

