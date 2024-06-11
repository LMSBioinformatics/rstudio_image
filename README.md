# LMS RStudio Docker Images

Versioned `Dockerfile` for the `RStudio` image used at the MRC LMS, building extra compilation compatibility into [`rocker/rstudio`](https://hub.docker.com/r/rocker/rstudio):

- maths headers: `libfftw3-dev`, `libgsl-dev`, `libglpk40-dev`, `libglpk-dev`
- compression headers: `liblzma-dev`, `libbz2-dev`, `libdeflate-dev`
- compatibility headers: `build-essential`, `libhdf5-dev`, `libpng-dev`, `libboost-all-dev`, `libxml2-dev`

The image is also built to include two generic dependencies of `RStudio`:

- [`renv`](https://rstudio.github.io/renv/articles/renv.html) for creating reproducible environments in R
- [`rmarkdown`](https://github.com/rstudio/rmarkdown) to facilitate `RStudio`'s knitting functionality

## Building

Clone and/or checkout the relevant GitHub branch and build locally using `docker`:

```bash
# From scratch
#   git clone git@github.com:LMSBioinformatics/rstudio_image.git && cd rstudio_image
# From an existing clone
#   git pull --all --tags --prune

BRANCH=4.4.0

git checkout $BRANCH
docker build -t lmsbio/rstudio:$BRANCH
```

Deployed images uploaded to [dockerhub](https://hub.docker.com/repository/docker/lmsbio/rstudio) can be converted using `singularity`:

```bash
BRANCH=4.4.0

singularity pull docker://lmsbio/rstudio:$BRANCH
```

## Updating

Image files for updated versions of `R` should be within a new named branch. Updates to existing versions should be tagged appropriately.

```bash
BRANCH=4.4.0
TAG=1.0

# create a new branch ...
git checkout -b $BRANCH
# ... or checkout an existing branch
git checkout $BRANCH

# update

# tag and push
git add -A
git commit -m <message>
git tag $TAG
git push --atomic origin $BRANCH $TAG
```
