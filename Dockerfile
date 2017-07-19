FROM rocker/verse:3.4.0

MAINTAINER Sarah Isselhorst <sarah.isselhorst@fu-berlin.de>

COPY . /mytestpkg

RUN . /etc/environment \

  && R -e "devtools::install('/mytestpkg', dep = TRUE)" \

  && R -e "rmarkdown::render('/mytestpkg/Analysis_Test/Challenge.rmd')"