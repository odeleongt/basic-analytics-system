# Basic analytics system

This repository contains a set of scripts that configure a basic R analytics system based on Ubuntu.

The scripts will install the necessary dependencies for R and RStudio, and configure the system to provide

- Analytics using the @tidyverse
- Document publishing using LaTeX / markdown and a variety of R packages
- Geospatial analytics (rgeos, rgdal, and geostatistics packages such as sf, sp, rgeos etc.)


## Usage

Run `./configure-ubuntu.sh` to run all necessary scripts in order.


## Source

Scripts based on @rocker-org dockerfiles (2017-05-17) for

- `docker/r-ver` (`/r-ver/Dockerfile` in rocker-org/rocker-versioned@ca37f95aa2b1242593af10bfaf3007ffb747342b)
- `docker/rstudio` (`/rstudio/Dockerfile` in rocker-org/rocker-versioned@ca37f95aa2b1242593af10bfaf3007ffb747342b)
- `docker/tidyverse` (`/tidyverse/Dockerfile` in rocker-org/rocker-versioned@c23efaa5e41305aa1064cd943bed1d2fb16c02a4)
- `docker/verse` (`/verse/Dockerfile` in rocker-org/rocker-versioned@ed169c0e6a670ba198f8957ace7abfe3870e4fdd)
- `docker/geospatial` (`/Dockerfile` in rocker-org/geospatial@0b4ebafc6e306264983d51e7b1d8dfa8d90d2f88)

and adapted to work on a fresh install of Ubuntu 16.04.2 LST.

