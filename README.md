# Containerized RStudio and PostgreSQL

This is a simple docker-compose.yaml for deploying RStudio with a postgres DB. The intent is to provide an easy way for users to learn how to interact with a DB.

## Getting started

There are two ways to run the services:

### `docker-compose up`

Running `docker-compose up` will use the images found in the [`.env`](.env) file. A volume will be mounted to `/home/rstudio/`.

### `docker-compose -f docker-compose-dev.yaml up`

Running `docker-compose -f docker-compose-dev.yaml up` will build the image using the [`Dockerfile`](Dockerfile) which really just copies the [`r_postgres.R`](r_postgres.R) script into the image for you. The volume is mounted to `/home/rstudio/persistent/`

[`r_postgres.R`](r_postgres.R) provides a very brief overview of using [`DBI`](https://dbi.r-dbi.org)
