# get the base image, this one has R, RStudio and pandoc
FROM rocker/verse:3.4.0

# required
MAINTAINER Sarah Isselhorst <sarah.isselhorst@fu-berlin.de>

COPY . /mytestpkg

RUN . /etc/environment \

  && apt-get update -y \
  && apt-get install -y libudunits2-dev libgdal-dev libgsl0-dev gdal-bin libgeos-dev libpng-dev libproj-dev \

  && R -e "options(repos='https://mran.microsoft.com/snapshot/2017-07-20'); "devtools::install('/mytestpkg', dep = TRUE)" \
  && R --vanilla "rmarkdown::render('/mytestpkg/Analysis_Test/Challenge.Rmd')"

