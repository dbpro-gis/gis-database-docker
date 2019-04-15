#!/bin/sh
docker run -it -v $(pwd):/data geodata/gdal $@
