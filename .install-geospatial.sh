#! /bin/bash

GDAL_VERSION=2.1.3
GEOS_VERSION=3.5.1
LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH


sudo apt-get update

##  && apt-get build-dep -y -o APT::Get::Build-Dep-Automatic=true libgdal-dev
sudo apt-get install -y --no-install-recommends lbzip2

## dev packages
sudo apt-get install -y --no-install-recommends libdap-dev libexpat1-dev libfftw3-dev libfreexl-dev libgsl0-dev libglu1-mesa-dev libhdf4-alt-dev libhdf5-dev liblwgeom-dev libkml-dev libnetcdf-dev libproj-dev libsqlite3-dev libssl-dev libtcl8.5 libtk8.5 libtiff5-dev libudunits2-dev libxerces-c-dev

## runtime packages
sudo apt-get install -y --no-install-recommends netcdf-bin unixodbc-dev

wget http://download.osgeo.org/gdal/${GDAL_VERSION}/gdal-${GDAL_VERSION}.tar.gz

tar -xf gdal-${GDAL_VERSION}.tar.gz

wget http://download.osgeo.org/geos/geos-${GEOS_VERSION}.tar.bz2

tar -xf geos-${GEOS_VERSION}.tar.bz2

## Install dependencies of gdal-$GDAL_VERSION
## && echo "deb-src http://deb.debian.org/debian jessie main" >> /etc/apt/sources.list
## Install libgeos

cd geos*

./configure

make
sudo make install
## Configure options loosely based on homebrew gdal2 https://github.com/OSGeo/homebrew-osgeo4mac/blob/master/Formula/gdal2.rb

cd ..
cd gdal*

./configure --with-curl --with-dods-root=/usr --with-freexl --with-geos --with-geotiff --with-hdf4 --with-hdf5=/usr/lib/x86_64-linux-gnu/hdf5/serial --with-libjson-c --with-netcdf --with-odbc --without-grass --without-libgrass

make
sudo make install

## Cleanup gdal & geos installation
cd ..
rm -rf gdal-* geos-*

. /etc/environment

## Install R packages labeled "core" in Spatial taskview 


Rscript -e "install.packages(c('DCluster', 'RColorBrewer', 'RandomFields', 'classInt', 'deldir', 'dggridR', 'gstat', 'lidR', 'maptools', 'ncdf4', 'proj4', 'raster', 'rgdal', 'rgeos', 'rlas', 'sf', 'sp', 'spacetime', 'spatstat', 'spdep', 'splancs', 'geoR'), repo = 'https://cran.rstudio.com/')"

