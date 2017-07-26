FROM ruby:2.4-alpine

ENV TZ Asia/Singapore
ENV PHANTOM_JS 2.1.1

RUN \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
    && apk --update add postgresql-client \
               nodejs \
               tzdata \
               libxml2 \
               libxslt \
               curl \
               wget \
               ca-certificates \
    && apk --update add --virtual build-dependencies \
               git \
               openssh-client \
               build-base \
               postgresql-dev \
               libxml2-dev \
               libxslt-dev \
    && bundle config --global jobs 4 \
    && adduser -S -h /app -u 10000 app \

    # Install phantomjs
    && cd /tmp \
    && wget -U "awesome browser" https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-$PHANTOM_JS-linux-x86_64.tar.bz2  \
    && tar -xjf phantomjs-$PHANTOM_JS-linux-x86_64.tar.bz2 \
    && cp phantomjs-$PHANTOM_JS-linux-x86_64/bin/phantomjs /usr/local/bin/phantomjs \
    && rm -rf phanomjs-$PHANTOM_JS-linux-x86_64* \
    # NOTE: This tarball contains the missing libraries needed to run phantomjs in alpine. However, it also overrides
    # /etc/passwd for some reason (messing up users). Have to revisit and look into this again.
    && curl -Ls "https://github.com/dustinblackman/phantomized/releases/download/2.1.1/dockerized-phantomjs.tar.gz" | tar xz -C /

WORKDIR /app/

CMD [ "irb" ]
