# run

```bash
docker-compose up --build
```

# Rsyslog

Rsyslog can be runned in client and server mode. 

## Rsyslog client

Env variables: 
* `$LISTEN_DIR`  - default: `/mnt/logs`
* `$LISTEN_PORT` - for syslog events
* `$DST_SERVER`  - destination for syslog server (required)
* `$DST_PORT`    - destination port (default: 5122)

## Rsyslog server

Env variables:
* `$PORT`           - listen port (default: 5122)
* `$LOG_STORE_DIR`  - directory for storing logs (default: `/mnt/logs`)


# nginx
nginx will send access logs to rsyslog client by tcp 
and error logs by writing it to file
# example-rsyslog
