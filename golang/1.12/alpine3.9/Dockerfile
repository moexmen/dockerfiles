FROM golang:1.12-alpine3.9

ENV GOOS linux
ENV GOARCH amd64
ENV CGO_ENABLED 0
ENV GOROOT /usr/local/go

ARG GOTESTSUM_VERSION=0.3.4
ARG GOLANGCILINT_VERSION=1.15.0
ARG GOSEC_VERSION=1.3.0

RUN apk --no-cache add build-base git bash \
    && wget -O /tmp/gotestsum.tar.gz https://github.com/gotestyourself/gotestsum/releases/download/v${GOTESTSUM_VERSION}/gotestsum_${GOTESTSUM_VERSION}_linux_amd64.tar.gz \
    && wget -O /tmp/golangci-lint.tar.gz https://github.com/golangci/golangci-lint/releases/download/v${GOLANGCILINT_VERSION}/golangci-lint-${GOLANGCILINT_VERSION}-linux-amd64.tar.gz \
    && wget -O /tmp/gosec.tar.gz https://github.com/securego/gosec/releases/download/${GOSEC_VERSION}/gosec_${GOSEC_VERSION}_linux_amd64.tar.gz \
    && tar -C /tmp -xzf /tmp/gotestsum.tar.gz \
    && tar -C /tmp -xzf /tmp/golangci-lint.tar.gz \
    && tar -C /tmp -xzf /tmp/gosec.tar.gz \
    && cp /tmp/gotestsum /usr/local/bin \
    && cp /tmp/golangci-lint*/golangci-lint /usr/local/bin \
    && cp /tmp/gosec /usr/local/bin \
    && rm -rf /tmp/* \
    && go get github.com/t-yuki/gocover-cobertura \
              github.com/moexmen/gas-report-filter

COPY bin/ /usr/local/bin/
