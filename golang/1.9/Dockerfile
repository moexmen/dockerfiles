FROM golang:1.9-alpine

ENV GOOS linux
ENV GOARCH amd64
ENV CGO_ENABLED 0

RUN apk --update add build-base git bash \
    && go get -v -u github.com/stretchr/testify \
                github.com/tebeka/go2xunit \
                github.com/t-yuki/gocover-cobertura \
                gopkg.in/alecthomas/gometalinter.v1 \
    && gometalinter.v1 --install

ADD go-test-coverage-lint /usr/local/bin/
