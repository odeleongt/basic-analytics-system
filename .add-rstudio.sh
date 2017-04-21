#!/bin/bash

################################################################################
## RSudio
################################################################################

## Download and install RStudio & dependencies
## Attempts to get detect latest version, otherwise falls back to version given in $VER
## Symlink pandoc, pandoc-citeproc so they are available system-wide
apt-get update

apt-get install -y --no-install-recommends file git libapparmor1 libcurl4-openssl-dev libedit2 libssl-dev lsb-release psmisc python-setuptools libjpeg62 libgstreamer0.10-0 libgstreamer-plugins-base0.10-0 sudo wget

RSTUDIO_LATEST=$(wget --no-check-certificate -qO- https://s3.amazonaws.com/rstudio-desktop/current.ver)

[ -z "$RSTUDIO_VERSION" ]
RSTUDIO_VERSION=$RSTUDIO_LATEST || true

wget -q http://download1.rstudio.org/rstudio-${RSTUDIO_VERSION}-amd64.deb

dpkg -i rstudio-${RSTUDIO_VERSION}-amd64.deb

rm rstudio-*-amd64.deb

## Symlink rstudio & pandoc & standard pandoc templates for use system-wide
ln -s /usr/lib/rstudio/bin/rstudio /usr/local/bin

ln -s /usr/lib/rstudio/bin/pandoc/pandoc /usr/local/bin

ln -s /usr/lib/rstudio/bin/pandoc/pandoc-citeproc /usr/local/bin

apt-get clean

rm -rf /var/lib/apt/lists/

## RStudio wants an /etc/R, will populate from $R_HOME/etc
mkdir -p /etc/R


