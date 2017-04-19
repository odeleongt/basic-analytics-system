#! /bin/bash

sudo apt-get update

sudo apt-get -y --no-install-recommends install libxml2-dev libcairo2-dev libsqlite-dev libmariadbd-dev libmariadb-client-lgpl-dev libpq-dev

. /etc/environment

Rscript -e "install.packages(c('devtools'), repo = 'https://cran.rstudio.com/')"
Rscript -e "install.packages(c('tidyverse', 'dplyr', 'dbplyr', 'ggplot2', 'profvis', 'formatR', 'remotes'), repo = 'https://cran.rstudio.com/')"
