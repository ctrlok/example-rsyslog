#!/bin/bash
if [[ -z $PORT ]]; then
  PORT=5122
  echo "Default listening port is $PORT"
fi

if [[ -z $LOG_STORE_DIR ]]; then
  LOG_STORE_DIR=/mnt/logs
  echo "Default log dir for storing logs is $LOG_STORE_DIR"
fi

cat >> /etc/rsyslog.conf <<EOF
# provides UDP syslog reception
module(load="imudp")
input(type="imudp" port="$PORT")

# provides TCP syslog reception
module(load="imtcp")
input(type="imtcp" port="$PORT")

\$AllowedSender TCP, *
\$AllowedSender UDP, *

action(type="omfile" dirCreateMode="0700" FileCreateMode="0644"
       File="$LOG_STORE_DIR/all.log")

\$template FILENAME,"$LOG_STORE_DIR/%fromhost-ip%.log"
*.* ?FILENAME
EOF




