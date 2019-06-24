# Geospatial processing tools

All there tools are to be used in conjunction with [Docker](https://docker.io).

Bind-mounts on the current working directory are used in order to process
locally available data. Working on data outside the current working directory
requires either manually switching the bind mount directory or switching to a
different working directory.

## GDAL tools

`gdal.sh` - Script that can be used to execute any gdal tool.

Example usage:

```
$ gdal.sh gdalinfo  # prints information on gdal
```

## PostGIS tools

`postgis.sh` Any tool installed inside the postgis container can be used.

Example usage:

```
$ postgis.sh /bin/bash  # launch interactive shell inside postgis container
```

## PostGIS server instance

### Test instance

The postgis server instance can be transiently deployed using `postgis_test.sh`.
This will create a docker container with port forwarding on the default postgres
port (5432). A database with name `geotest` will be created.

CAVEAT: `./data` will be bind mounted onto the postgres data folder. Clear this
folder in order to create a new database on restart.

### Persistent deployment with kubernetes

A kubernetes config in `postgis.yml` is included. It contains descriptions for
the service, deployment and pod. Data is stored the PersistentVolume storage
driver on the local node in a path specified under `spec.local.path`. Change
this in order to save the database to a different location. Swapping the storage
backend also requires changing the `storageClassName` for the persistent volume
claim.

An additionally secret needs to be specified separately in a file and loaded
into the cluster.

Example:

```
apiVersion: v1
kind: Secret
metadata:
  name: postgis-secret
type: Opaque
stringData:
  password: <INSERT DB PASSWORD>
```

Load into the cluster using `kubectl apply -f <filename>`.


## Geoserver

Geoserver is a server backend for accessing geospatial information. A kubernetes
config for a single node instance using a local data storage mount is available
in `geoserver.yml`.
