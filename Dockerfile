FROM python:3.7.4

RUN set -x \
    && apt-get update -y \
    && mkdir -p /usr/app/src \
    && mkdir -p /usr/app/logs

WORKDIR /usr/app/src

VOLUME [ "/usr/app/logs" ]

ONBUILD COPY requirements.txt requirements.txt

ONBUILD RUN set -x \
    && pip install --no-cache-dir -r requirements.txt -U pip \
    && rm requirements.txt \
    && rm -rf /var/lib/apt/lists/*

ONBUILD COPY . .