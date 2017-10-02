#!/bin/bash

echo > /etc/rsyslog.conf

if [[ ! -z $DST_SERVER ]]; then
  echo "Starting rsyslog in client mode"
  bash /entrypoint-client.sh
else
  echo "Starting rsyslog in server mode"
  bash /entrypoint-server.sh
fi

tail -n 20 /etc/rsyslog.conf

exec /tini -- $@
