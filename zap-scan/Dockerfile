FROM moexmen/alpine:3.7
ENV PHANTOM_JS 2.1.1
ENV DOCKERIZE_VERSION v0.6.1

# Install required packages
RUN apk add --no-cache \
        bash \
        build-base \
        git \
        py-pip \
        python \
        python-dev \
        sqlite \
        tar \
        wget \
        openssl \
    && rm -rf /var/cache/apk/* \

    # Install PhantomJS
    && cd /tmp \
    && wget -U "awesome browser" https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-$PHANTOM_JS-linux-x86_64.tar.bz2  \
    && tar -xjf phantomjs-$PHANTOM_JS-linux-x86_64.tar.bz2 \
    && cp phantomjs-$PHANTOM_JS-linux-x86_64/bin/phantomjs /usr/local/bin/phantomjs \
    && rm -rf phanomjs-$PHANTOM_JS-linux-x86_64* \
    && curl -Ls "https://github.com/dustinblackman/phantomized/releases/download/2.1.1/dockerized-phantomjs.tar.gz" | tar xz -C / \

    # Install htcap & install python dependencies
    && cd /app \
    && git clone https://github.com/segment-srl/htcap.git . \
    && touch __init__.py \
    && pip install requests python-owasp-zap-v2.4 \

    # Install dockerize
    && wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz
