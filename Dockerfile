# =================================================================
#
# Author: Joost van Ulden <joost.vanulden@canada.ca>
#
# Copyright (c) 2020 Government of Canada
#
# Permission is hereby granted, free of charge, to any person
# obtaining a copy of this software and associated documentation
# files (the "Software"), to deal in the Software without
# restriction, including without limitation the rights to use,
# copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the
# Software is furnished to do so, subject to the following
# conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
# OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
# HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
# WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
# OTHER DEALINGS IN THE SOFTWARE.
#
# =================================================================

FROM debian:sid-20220125-slim

LABEL org.opencontainers.image.authors="Joost van Ulden <joost.vanulden@canada.ca>, Anthony Fok <anthony.fok@canada.ca>"
LABEL org.opencontainers.image.source="https://github.com/opendrr/python-env"
LABEL org.opencontainers.image.version="1.1.0"
LABEL org.opencontainers.image.vendor="Government of Canada"
LABEL org.opencontainers.image.licenses="MIT"

# copy required files
COPY . .

RUN echo 'Acquire::Check-Valid-Until "false";' > /etc/apt/apt.conf.d/docker-snapshot.conf && \
    sed -i '/snapshot.debian.org/s/^# //; /deb.debian.org/s/^/# /' /etc/apt/sources.list && \
    echo "deb http://deb.debian.org/debian bullseye main" >> /etc/apt/sources.list && \
    echo 'Package: *\n\
Pin: release n=bullseye\n\
Pin-Priority: 50' > /etc/apt/preferences.d/git-in-bullseye && \
    cat /etc/apt/preferences.d/git-in-bullseye && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        curl gdal-bin postgresql-client \
        dos2unix eatmydata jq moreutils nano time xz-utils \
        python3-numpy python3-pandas python3-psycopg2 python3-psycopg2cffi \
        python3-requests python3-sqlalchemy pypy3 python3-pip && \
    apt-get install -y --no-install-recommends -t bullseye git git-lfs && \
    pip3 install elasticsearch==7.16.1 && \
    rm -rf /var/lib/apt/lists/*

ENV PYTHONUNBUFFERED 1
