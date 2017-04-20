#! /bin/bash

################################################################################
## Install VirtualBox
################################################################################

## Setup repository
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb http://download.virtualbox.org/virtualbox/debian xenial contrib"

## Install
sudo apt-get update
sudo apt-get -y --no-install-recommends  install virtualbox-5.1
sudo apt-get -y install dkms


################################################################################
## Install Docker
################################################################################

## Dependencies
sudo apt-get -y install apt-transport-https ca-certificates curl software-properties-commoncurl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

## TODO: Check keys
apt-key adv --list-public-keys  --with-fingerprint --with-colons Docker Release | grep fpr
## Should equal
echo "9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD88"

## Set up *stable* repository
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

## Install Community Eddition
sudo apt-get update
sudo apt-get -y install docker-ce

## Verify that Docker CE or Docker EE is installed correctly by running the hello-world image.
sudo docker run hello-world

