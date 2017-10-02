FROM ubuntu
RUN apt-get update -y
RUN apt-get install -y rsyslog
# Add Tini
ENV TINI_VERSION v0.16.1
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
ADD entrypoint.sh /entrypoint.sh 
ADD entrypoint-server.sh /entrypoint-server.sh 
ADD entrypoint-client.sh /entrypoint-client.sh 
ENTRYPOINT [ "/bin/bash", "/entrypoint.sh" ]
CMD ["rsyslogd", "-nd"]
