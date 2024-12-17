ARG BASE_IMAGE=rocker/rstudio
ARG BASE_VERSION=4.4.0

FROM ${BASE_IMAGE}:${BASE_VERSION}

LABEL \
  name="lmsbio/rstudio" \
  version=${BASE_VERSION} \
  url="https://github.com/LMSBioinformatics/rstudio_image" \
  maintainer="bioinformatics@lms.mrc.ac.uk"

RUN apt-get update -y

RUN apt-get install -y --no-install-recommends\
  automake \
  biber \
  build-essential \
  byacc \
  cmake \
  coinor-libcgl-dev \
  coinor-libsymphony-dev \
  coinor-libsymphony-doc \
  curl \
  default-jdk \
  default-libmysqlclient-dev \
  fortran77-compiler \
  gdb \
  ggobi \
  graphviz \
  imagemagick \
  jags \
  libapparmor-dev \
  libarchive-dev \
  libarchive-extract-perl \
  libavfilter-dev \
  libboost-all-dev \
  libbz2-dev \
  libcairo2-dev \
  libcgi-pm-perl \
  libcurl4-openssl-dev \
  libdeflate-dev \
  libdbd-mysql-perl \
  libdbi-perl \
  libeigen3-dev \
  libfftw3-dev \
  libfile-copy-recursive-perl \
  libfuse-dev \
  libgdal-dev \
  libgeos-dev \
  libgit2-dev \
  libgl1-mesa-dev \
  libglpk40 \
  libglpk-dev \
  libglu1-mesa-dev \
  libgmp3-dev \
  libgsl0-dev \
  libgslcblas0 \
  libgtk2.0-dev \
  libgtkmm-2.4-dev \
  libhdf5-dev \
  libhdf5-serial-dev \
  libhiredis-dev \
  libjpeg-dev \
  libjpeg-turbo8-dev \
  libjpeg8-dev \
  liblapack-dev \
  liblz4-dev \
  liblzma-dev \
  libmagick++-dev \
  libmariadb-dev-compat \
  libmodule-build-perl \
  libmpfr-dev \
  libmysqlclient-dev \
  libncurses-dev \
  libnetcdf-dev \
  libopenbabel-dev \
  libopenmpi-dev \
  libpcre2-dev \
  libperl-dev \
  libpng-dev \
  libpoppler-cpp-dev \
  libpoppler-glib-dev \
  libpq-dev \
  libproj-dev \
  libprotobuf-dev \
  libprotoc-dev \
  librdf0-dev \
  libreadline-dev \
  libsasl2-dev \
  libsbml5-dev \
  libtiff5-dev \
  libudunits2-dev \
  libv8-dev \
  libxml-simple-perl \
  libxml2-dev \
  libxpm-dev \
  libxt-dev \
  libz-dev \
  libzmq3-dev \
  libzstd-dev \
  mono-runtime \
  mpi-default-bin \
  ocl-icd-opencl-dev \
  openmpi-bin \
  openmpi-common \
  openmpi-doc \
  pigz \
  pkg-config \
  protobuf-compiler \
  python3-dev \
  python3-pip \
  python3-venv \
  sqlite3 \
  tabix \
  tcl8.6-dev \
  tk-dev \
  xfonts-100dpi \
  xfonts-75dpi \
  zlib1g-dev

RUN apt-get clean && apt-get autoremove -y && apt-get autoclean -y && rm -rf /var/lib/apt/lists/*

RUN pip3 install scikit-learn pandas pyyaml --break-system-packages
RUN R --no-echo --no-restore --no-save -e "install.packages(c('renv', 'rmarkdown', 'devtools'))"
