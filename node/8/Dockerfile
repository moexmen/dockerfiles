FROM node:8-alpine

ENV TZ Asia/Singapore

RUN \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
    && apk --no-cache add python build-base tzdata

WORKDIR /app
