#! /bin/bash

sudo apt-get update

sudo apt-get -y --no-install-recommends install unixodbc unixodbc-dev tdsodbc freetds-bin

Rscript -e "install.packages(c('odbc', 'RSQLite'), repo = 'https://cran.rstudio.com/')"

## Add configuration files
## Files not tracked for privacy
sudo cp private/freetds.conf /etc/freetds/
sudo cp private/odbc*.ini /etc/

