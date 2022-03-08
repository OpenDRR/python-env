# python-env

Docker image for Linux-based Python environment,
tailored for OpenDRR/opendrr-api pipeline process.

## Updating ghcr.io/opendrr/python-env:edge (nightly build)

1. Push your latest commits to the `master` branch.
1. Look in the [Actions menu](https://github.com/OpenDRR/python-env/actions) https://github.com/OpenDRR/python-env/actions to check that the "Build and push container to GHCR" workflow is run successfully for the `master` branch.
1. Look in https://github.com/OpenDRR/python-env/pkgs/container/python-env and check under "Recent tagged image versions" that the a new `edge` version is published.
1. To use this image for local testing, edit python/Dockerfile in OpenDRR/opendrr-api and change the first line to `FROM ghcr.io/opendrr/python-env:edge`.  You may need to ma...? (TODO)

TODO: What is this for?

```
docker pull ghcr.io/opendrr/python-env:edge
```

## Release ghcr.io/opendrr/python-env:latest (production)

1. Create a new release tag... (TODO)
1. TODO
