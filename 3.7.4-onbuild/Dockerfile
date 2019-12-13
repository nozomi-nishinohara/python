FROM python:3.7.4

ENV DEBIAN_FRONTEND noninteractive
ENV TZ 'Asia/Tokyo'

COPY wait-for-it.sh /usr/wait-for-it.sh

RUN set -x \
    && mkdir -p /usr/app/src \
    && rm -rf /var/lib/apt/lists/* \
    && chmod +x /usr/wait-for-it.sh \
    && apt-get update \
    && apt-get install --yes --no-install-recommends \
    netcat

WORKDIR /usr/app/src

ONBUILD COPY requirements.txt requirements.txt

ONBUILD RUN set -x \
    && pip install --no-cache-dir -r requirements.txt -U pip

ONBUILD COPY . .