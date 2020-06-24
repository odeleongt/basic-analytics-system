#!/bin/bash

## Step through script
set -x
trap read debug

R_VERSION=4.0.2
R_HOME=$HOME/R/library/4.0

################################################################################
## build R from source
################################################################################


## Add a default CRAN mirror
echo "options(repos = c(CRAN = 'https://cran.rstudio.com/'), download.file.method = 'libcurl')" >> /usr/local/lib/R/etc/Rprofile.site


## Fix library path
echo "R_LIBS_USER='$R_HOME'" >> /usr/local/lib/R/etc/Renviron

echo "R_LIBS=\${R_LIBS-'$R_HOME:/usr/local/lib/R/library:/usr/lib/R/library'}" >> /usr/local/lib/R/etc/Renviron

## Clean up from R source install
cd ../..

rm -rf tmp


## Change ownership for installed packages
chmod g+wx $R_HOME
chown $SUDO_USER:$SUDO_USER -R $HOME/R

