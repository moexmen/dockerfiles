FROM golang:1.8-alpine

ENV GOOS linux
ENV GOARCH amd64
ENV CGO_ENABLED 0

RUN apk --update add build-base git bash \
    && go get -u github.com/stretchr/testify \
                github.com/tebeka/go2xunit \
                github.com/t-yuki/gocover-cobertura \
                github.com/golang/lint/golint

ADD go-test-coverage-lint /usr/local/bin/
