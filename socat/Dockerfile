FROM alpine:3.8

RUN apk --no-cache add socat

ADD docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
