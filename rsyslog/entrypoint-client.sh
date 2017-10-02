#!/bin/bash

HOSTNAME=`hostname -f`

if [[ -z $LISTEN_DIR ]]; then
  LISTEN_DIR=/mnt/logs
  echo "Default directory for listening logs is $LISTEN_DIR"
fi

if [[ ! -z $LISTEN_PORT ]]; then
  cat >> /etc/rsyslog.conf <<EOF
# provides UDP syslog reception
module(load="imudp")
input(type="imudp" port="$LISTEN_PORT")

# provides TCP syslog reception
module(load="imtcp")
input(type="imtcp" port="$LISTEN_PORT")
EOF
  echo "Listening port is $LISTEN_PORT"
fi

if [[ -z $DST_PORT ]]; then
  DST_PORT=5122
  echo "Default port for dst rsyslog server is $PORT"
fi

cat >> /etc/rsyslog.conf <<EOF
# File 2
module(load="imfile")
input(type="imfile"
      File="$LISTEN_DIR/*"
      Tag="$HOSTNAME")
EOF

cat >> /etc/rsyslog.conf <<EOF
*.* @@$DST_SERVER:$DST_PORT
EOF
