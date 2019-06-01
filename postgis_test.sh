#!/bin/sh
mkdir -p data
docker run --rm --name postgis-test --env POSTGRES_USER=postgres --env POSTGRES_PASSWORD=devtest --env POSTGRES_DB=geotest --env POSTGIS_ENABLE_OUTDB_RASTERS=1 --env POSTGIS_GDAL_ENABLED_DRIVERS=ENABLE_ALL -it -p 5432:5432 -v $(pwd)/data:/var/lib/postgresql/data mdillon/postgis:11-alpine $@
