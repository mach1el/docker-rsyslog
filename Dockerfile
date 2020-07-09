FROM alpine:latest

MAINTAINER Michael Phantom <atemhacking@gmail.com>

RUN  apk add --update rsyslog rsyslog-tls \
  && rm -rf /var/cache/apk/*

RUN mkdir -p /var/log/docker \
    && mkdir -p /var/log/docker/no_tag/ \
    && mkdir -p /var/log/remote/ \
    && mkdir -p /var/spool/rsyslog \
    && chmod 644 /var/log/docker -R && chmod 644 /var/log/remote/ -R && chmod 644 /var/spool/rsyslog

ADD units /

EXPOSE 514/tcp 514/udp

VOLUME [ "/var/log", "/etc/rsyslog.d" ]

ENTRYPOINT ["rsyslogd", "-n", "-f", "/etc/rsyslog.conf"]