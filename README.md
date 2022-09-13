# python-env

`python-env` is a Docker image for Linux-based Python environment,
tailored for the OpenDRR/opendrr-api stack build process.

[![GitHub Super-Linter](https://github.com/OpenDRR/python-env/workflows/Lint%20Code%20Base/badge.svg)](https://github.com/marketplace/actions/super-linter)

## Versions and branches

Existing versions/branches:

* v1.0: Python 3.8.5, based on debian:sid-20200720-slim (between Debian 10 and Debian 11, `opendrr/python-env:1.0`)
* v1.0.3: Python 3.8.5, based on debian:sid-20200720-slim (between Debian 10 and Debian 11, `ghcr.io/opendrr/python-env:1.0.3`)
* v1.1.0: Python 3.8.6, based on debian:sid-20201012-slim (between Debian 10 and Debian 11)
* v1.2.x, `latest` (stable): Python 3.8.6, Elasticsearch 7.16, based on debian:sid-20201012-slim, with the use of requirements.txt restored
  * `debian-sid-20201012` branch, also the `master` branch currently
* v1.3.x (dev): Python 3.9.2, Elasticsearch 7.17, based on debian:bullseye-slim (Debian 11, released August 2022)
  * `debian-bullseye` branch

Planned branches/versions:

* v1.4.x (dev): Python 3.10.x, Elasticsearch 8.x, based on debian:bookworm-slim (Debian 12, expected to be released in mid-2023)
  * `debian-bookworm` branch

## Updating ghcr.io/opendrr/python-env:edge (for testing)

1. Push your latest commits to the `master` branch.
2. Look in the [Actions menu](https://github.com/OpenDRR/python-env/actions) <https://github.com/OpenDRR/python-env/actions>
   to check that the "Build and push container to GHCR" workflow is run successfully for the `master` branch.
3. Look in <https://github.com/OpenDRR/python-env/pkgs/container/python-env>
   and check under "Recent tagged image versions" that the a new `edge` version is published.

To test locally:

```console
docker pull ghcr.io/opendrr/python-env:edge
docker run -it --rm ghcr.io/opendrr/python-env:edge
```

Not recommend to use the `edge` version in python/Dockerfile of OpenDRR/opendrr-api.

## Creating ghcr.io/opendrr/python-env:latest production releases

1. Create a new release tag,
   e.g. a signed tag from the command-line by using `git tag -s v1.2.4`,
   typing up a brief release notes, and `git push origin v1.2.4`. (optional)
2. Alternatively or additionally, [draft a new release](https://github.com/OpenDRR/python-env/releases/new)
   through the GitHub web interface so the new release and release notes are immediately visible.
3. Visit <https://github.com/OpenDRR/python-env/pkgs/container/python-env>
   and check under "Recent tagged image versions" that the a new image versioned `latest` `1.2.4` is published.

To test locally:

```console
docker run -it --rm ghcr.io/opendrr/python-env:1.2.4
```

To test with OpenDRR/opendrr-api, edit the `FROM` line in python/Dockerfile accordingly, e.g. `FROM ghcr.io/opendrr/python-env:1.2.4`.
