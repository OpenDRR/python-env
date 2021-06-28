FROM debian:buster-slim

LABEL maintainer="Joost van Ulden <joost.vanulden@canada.ca>" 

# copy required files
COPY . .

RUN echo "deb http://deb.debian.org/debian buster-backports main" >> /etc/apt/sources.list && \
apt-get update && \
apt-get install -y -t buster-backports libpq-dev gcc curl git git-lfs gdal-bin python3-pip postgresql-client dos2unix eatmydata jq time && \
pip3 install psycopg2~=2.6 && \
pip3 install --upgrade pip && pip install -r requirements.txt && \
apt-get autoremove -y gcc

ENV PYTHONUNBUFFERED 1
