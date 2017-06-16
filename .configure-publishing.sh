#! /bin/bash

R_HOME=$HOME/R/library/3.0

sudo apt-get update

sudo apt-get install -y --no-install-recommends ghostscript imagemagick

## system dependency of hadley/pkgdown
sudo apt-get install -y --no-install-recommends libmagick++-dev

## system dependency of hunspell (devtools)
sudo apt-get install -y --no-install-recommends libhunspell-dev
## R CMD Check wants qpdf to check pdf sizes, or iy throws a Warning 
sudo apt-get install -y --no-install-recommends qpdf
## for git via ssh key 
sudo apt-get install -y --no-install-recommends ssh
## for building pdfs via pandoc/LaTeX
sudo apt-get install -y --no-install-recommends lmodern texlive-fonts-recommended texlive-humanities texlive-latex-extra texinfo

sudo apt-get clean

sudo rm -rf /var/lib/apt/lists/

## R manuals use inconsolata font, but texlive-fonts-extra is huge, so:
cd /usr/share/texlive/texmf-dist

wget http://mirrors.ctan.org/install/fonts/inconsolata.tds.zip

unzip inconsolata.tds.zip

rm inconsolata.tds.zip

sudo echo "Map zi4.map" >> /usr/share/texlive/texmf-dist/web2c/updmap.cfg

sudo mktexlsr

sudo updmap-sys

## And some nice R packages for publishing-related stuff 
. /etc/environment

## Document packages
Rscript -e "install.packages(c('bookdown', 'rticles', 'rmdshower', 'flexdashboard', 'pander', 'tufte', 'xaringan'), repo = 'https://cran.rstudio.com/')"

## Content packages
Rscript -e "install.packages(c('leaflet', 'dygraphs', 'plotly'), repo = 'https://cran.rstudio.com/')"


