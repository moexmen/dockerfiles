FROM moexmen/alpine:3.8
ENV PHANTOM_JS 2.1.1

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
        nodejs \
    && rm -rf /var/cache/apk/* \
    # Install htcap & install python dependencies
    && cd /app \
    && git clone https://github.com/fcavallarin/htcap.git . \
    && touch __init__.py \
    && pip install requests python-owasp-zap-v2.4
