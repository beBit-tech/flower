#!/bin/sh
set -e

cp /celeryconfig.py /data

if [ "$1" = 'flower' ]; then
	exec celery flower '--persistent=True' "$@"
fi

exec "$@"
