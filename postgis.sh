#!/bin/sh
docker run -it --env PGPASSWORD=$PGPASSWORD -v $(pwd):/data postgis $@
