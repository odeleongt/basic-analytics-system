#!/bin/bash

## Step through script
set -x
trap read debug

R_VERSION=4.2.1
R_HOME=$HOME/R/library/4.0

mkdir -p tmp

## Add a library directory (for user-installed packages)
mkdir -p $R_HOME




################################################################################
## R dependencies
################################################################################

sudo apt-get update

sudo apt-get install -y --no-install-recommends synaptic bash-completion ca-certificates file fonts-texgyre g++ gfortran gsfonts libbz2-1.0 libcurl4 libicu-dev libopenblas-dev libpangocairo-1.0-0 libpcre3 libpng16-16 libtiff5 liblzma5 locales make unzip zip zlib1g

echo "en_US.UTF-8 UTF-8" | sudo tee -a /etc/locale.gen

sudo locale-gen en_US.utf8

sudo /usr/sbin/update-locale LANG=en_US.UTF-8

BUILDDEPS="curl default-jdk libbz2-dev libcairo2-dev libcurl4-openssl-dev libpango1.0-dev libjpeg-dev libicu-dev libpcre3-dev libpng-dev libreadline-dev libtiff5-dev liblzma-dev libx11-dev libxt-dev perl tcl8.6-dev tk8.6-dev texinfo texlive-extra-utils texlive-fonts-recommended texlive-fonts-extra texlive-latex-recommended x11proto-core-dev xauth xfonts-base xvfb zlib1g-dev"

sudo apt-get install -y --no-install-recommends $BUILDDEPS


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

## Use littler installation scripts
Rscript -e "install.packages(c('littler', 'docopt'), repo = 'https://cran.rstudio.com/')"

ln -sf $R_HOME/littler/examples/install2.r /usr/local/bin/install2.r

ln -sf $R_HOME/littler/examples/installGithub.r /usr/local/bin/installGithub.r

ln -sf $R_HOME/littler/bin/r /usr/local/bin/r

## Clean up from R source install
cd ../..

rm -rf tmp

sudo apt-get autoremove -y

sudo apt-get autoclean -y

sudo rm -rf /var/lib/apt/lists/*


## Change ownership for installed packages
sudo chmod g+wx $R_HOME
sudo chown $SUDO_USER:$SUDO_USER -R $HOME/R

