FROM jenkins/jenkins:lts-alpine

ENV TZ Asia/Singapore
ENV GLIBC 2.25-r0
ENV DOCKER_COMPOSE 1.15.0

USER root

RUN \
    apk add --no-cache openssl tzdata rsync \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
    && curl -L https://get.docker.com/builds/Linux/x86_64/docker-latest.tgz > docker-latest.tgz \
    && tar -xvf docker-latest.tgz \
    && mv docker/* /usr/bin \
    && rm -rf docker docker-latest.tgz \

    # Compose need the following to work in the alpine image
    && wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://raw.githubusercontent.com/sgerrand/alpine-pkg-glibc/master/sgerrand.rsa.pub \
    && wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/$GLIBC/glibc-$GLIBC.apk \
    && apk add --no-cache glibc-$GLIBC.apk && rm glibc-$GLIBC.apk \
    && ln -s /lib/libz.so.1 /usr/glibc-compat/lib/ \
    && ln -s /lib/libc.musl-x86_64.so.1 /usr/glibc-compat/lib \

    && curl -L https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE}/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose \
    && chmod +x /usr/local/bin/docker-compose

USER jenkins
