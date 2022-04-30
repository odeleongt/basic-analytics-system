#!/bin/bash

## Step through script
set -x
trap read debug

R_VERSION=4.0.5
R_HOME=$HOME/R/library/4.0

mkdir -p tmp

## Add a library directory (for user-installed packages)
mkdir -p $R_HOME




################################################################################
## build R from source
################################################################################
cd tmp/

## Download source code
curl -O https://cran.r-project.org/src/base/R-4/R-${R_VERSION}.tar.gz

## Extract source code
tar -xf R-${R_VERSION}.tar.gz

cd R-${R_VERSION}

## Set compiler flags
R_PAPERSIZE=letter R_BATCHSAVE="--no-save --no-restore" R_BROWSER=xdg-open PAGER=/usr/bin/pager PERL=/usr/bin/perl R_UNZIPCMD=/usr/bin/unzip R_ZIPCMD=/usr/bin/zip R_PRINTCMD=/usr/bin/lpr LIBnn=lib AWK=/usr/bin/awk CFLAGS="-g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g" CXXFLAGS="-g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g"

## Configure options
 ./configure --enable-R-shlib --enable-memory-profiling --with-readline --with-blas="-lopenblas" --disable-nls --without-recommended-packages

## Build and install
make -j 8

sudo make install


## Add a default CRAN mirror
echo "options(repos = c(CRAN = 'https://cran.rstudio.com/'), download.file.method = 'libcurl')" | sudo tee -a /usr/local/lib/R/etc/Rprofile.site


## Fix library path
echo "R_LIBS_USER='$R_HOME'" | sudo tee -a /usr/local/lib/R/etc/Renviron

echo "R_LIBS=\${R_LIBS-'$R_HOME:/usr/local/lib/R/library:/usr/lib/R/library'}" | sudo tee -a /usr/local/lib/R/etc/Renviron


## Clean up from R source install
cd ../..

rm -rf tmp



## Change ownership for installed packages
sudo chmod g+wx $R_HOME
sudo chown $SUDO_USER:$SUDO_USER -R $HOME/R
