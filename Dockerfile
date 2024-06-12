FROM rocker/rstudio:4.4.0  
LABEL maintainer="bioinformatics@lms.mrc.ac.uk"

RUN apt-get -y update
RUN apt-get -y install \
  build-essential \
  libhdf5-dev libpng-dev libxml2-dev libcurl4-openssl-dev libmysqlclient-dev \
  libboost-all-dev libfftw3-dev libgsl-dev libglpk40 libglpk-dev \
  liblzma-dev libbz2-dev libdeflate-dev libzstd-dev zlib1g-dev \
  pigz
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN R --no-echo --no-restore --no-save -e "install.packages(c('renv', 'rmarkdown'))"
