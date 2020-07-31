FROM debian:sid-slim

LABEL maintainer="Joost van Ulden <joost.vanulden@canada.ca>" 

# copy required files
COPY . .

RUN apt-get update && apt-get install -y libpq-dev gcc curl git-lfs gdal-bin python3-pip && \
    pip3 install psycopg2~=2.6 && \
    apt-get autoremove -y gcc && \
    apt-get install -y postgresql-client && \
    pip3 install --upgrade pip && pip install -r requirements.txt

ENV PYTHONUNBUFFERED 1
