#!/bin/sh
set -e

CONFIG_PATH=/data/celeryconfig.py
touch ${CONFIG_PATH}.tmp
echo "timezone = '$CELERY_TIMEZONE'" >> ${CONFIG_PATH}.tmp
echo "enable_utc = $CELERY_ENABLE_UTC" >> ${CONFIG_PATH}.tmp
mv -f ${CONFIG_PATH}.tmp ${CONFIG_PATH}

if [ "$1" = 'flower' ]; then
	exec celery flower '--persistent=True' "$@"
fi

exec "$@"
