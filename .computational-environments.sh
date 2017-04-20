#! /bin/bash


## Install VirtualBox
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb http://download.virtualbox.org/virtualbox/debian xenial contrib"

sudo apt-get update
sudo apt-get -y --no-install-recommends  install virtualbox-5.1
sudo apt-get -y install dkms

