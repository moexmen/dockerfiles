FROM jenkins/jenkins:lts-alpine

ENV TZ Asia/Singapore
ENV DOCKER_VERSION 18.09.0
ENV DOCKER_COMPOSE_VERSION 1.22.0
ENV GIT_LFS_VERSION 2.6.1

USER root

RUN \
    apk add --no-cache openssl tzdata rsync python3 make \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
    && curl -L -o docker-latest.tgz https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}.tgz \
    && tar -xf docker-latest.tgz \
    && mv docker/* /usr/bin \
    && rm -rf docker docker-latest.tgz \
    && pip3 install "docker-compose==${DOCKER_COMPOSE_VERSION}" \
    && curl -L -o git-lfs.tar.gz https://github.com/git-lfs/git-lfs/releases/download/v${GIT_LFS_VERSION}/git-lfs-linux-amd64-v${GIT_LFS_VERSION}.tar.gz \
    && mkdir -p git-lfs \
    && tar -xf git-lfs.tar.gz -C git-lfs \
    && ./git-lfs/install.sh \
    && rm -rf git-lfs.tar.gz git-lfs

USER jenkins
