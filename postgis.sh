#!/bin/sh
mkdir -p data
docker run --env POSTGRES_PASSWORD=devtest --env POSTGRES_DB=geotest -it -v data:/var/lib/postgresql/data mdillon/postgis:11-alpine $@
