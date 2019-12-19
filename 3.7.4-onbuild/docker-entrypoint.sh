#!/bin/bash

set -e

if [ "${REQUIREMENTS:-"Y"}" = "Y" ]; then
    pip install --no-cache-dir -r requirements.txt -U pip
fi

exec "$@"