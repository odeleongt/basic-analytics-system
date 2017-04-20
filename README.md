# Basic analytics system

This repository contains a set of scripts that configure a basic R analytics system based on Ubuntu.

The scripts will install the necessary dependencies for R and RStudio, and configure the system to provide

- Analytics using the [tidyverse](https://github.com/tidyverse/)
- Document publishing using LaTeX / markdown and a variety of R packages
- Geospatial analytics (rgeos, rgdal, and geostatistics packages such as sf, sp, rgeos etc.)
- Reproducibility for computational environments (i.e. VirtualBox, Docker, [rocker/verse](https://hub.docker.com/r/rocker/verse/))


## Usage

Run `./configure-ubuntu.sh` to run all necessary scripts in order.


## Source

Scripts based on [rocker-org](https://github.com/rocker-org) dockerfiles (2017-05-17) for

- `docker/r-ver` ([/r-ver/Dockerfile](https://github.com/rocker-org/rocker-versioned/blob/ca37f95aa2b1242593af10bfaf3007ffb747342b/r-ver/Dockerfile))
- `docker/rstudio` ([/rstudio/Dockerfile](https://github.com/rocker-org/rocker-versioned/blob/ca37f95aa2b1242593af10bfaf3007ffb747342b/rstudio/Dockerfile))
- `docker/tidyverse` ([/tidyverse/Dockerfile](https://github.com/rocker-org/rocker-versioned/blob/c23efaa5e41305aa1064cd943bed1d2fb16c02a4/tidyverse/Dockerfile))
- `docker/verse` ([/verse/Dockerfile](https://github.com/rocker-org/rocker-versioned/blob/ed169c0e6a670ba198f8957ace7abfe3870e4fdd/verse/Dockerfile))
- `docker/geospatial` ([/Dockerfile](https://github.com/rocker-org/geospatial/blob/0b4ebafc6e306264983d51e7b1d8dfa8d90d2f88/Dockerfile))

and adapted to work on a fresh install of [Ubuntu 16.04.2 LST](http://releases.ubuntu.com/16.04/ubuntu-16.04.2-desktop-amd64.iso).

