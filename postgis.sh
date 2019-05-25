#!/bin/sh
docker run -it -v $(pwd):/data postgis $@
