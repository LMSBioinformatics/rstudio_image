# LMS RStudio Docker Images

Versioned `Dockerfile` for the `RStudio` image used at the MRC LMS, fusing
[`rocker/rstudio`](https://hub.docker.com/r/rocker/rstudio)
with
[`bioconductor/bioconductor_docker`](https://hub.docker.com/r/bioconductor/bioconductor_docker),
alongside a few extras.

To provide some extra initial functionality, the `renv`, `rmarkdown`, `tidyverse`,
and `svglite` `R` packages are pre-installed.

## Building

Clone and/or checkout the relevant GitHub branch and build locally using `docker`:

```bash
# From scratch
#   git clone git@github.com:LMSBioinformatics/rstudio_image.git && cd rstudio_image
# From an existing clone
#   git pull --all --tags --prune

BRANCH=4.5.0

git checkout $BRANCH
docker build -t lmsbio/rstudio:$BRANCH .
```

## Deploying

Images uploaded to
[dockerhub](https://hub.docker.com/repository/docker/lmsbio/rstudio)
can be converted using `singularity`:

```bash
BRANCH=4.5.0

module load singularityce
singularity pull docker://lmsbio/rstudio:$BRANCH
```

## Updating

`Dockerfile`s for updated versions of `R` should be within new named branches.
Updates to existing versions should be tagged appropriately.

```bash
BRANCH=4.5.0
TAG="${BRANCH}_1.0"

# create a new branch ...
git checkout -b $BRANCH
# ... or checkout an existing branch
git checkout $BRANCH

# updates ...

# tag and push
git add -A
git commit -m <message>
git tag $TAG
git push --atomic origin $BRANCH $TAG
```
