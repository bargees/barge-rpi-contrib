FROM arm64v8/alpine:3.5

ARG VERSION="1.16.4"
ENV GOPATH="/tmp/go"

RUN apk --no-cache --update add --virtual build-deps build-base go git && \
    go get github.com/tools/godep && \
    go get github.com/ahmetb/govvv && \
    \
    mkdir -p "${GOPATH}/src/github.com/aacebedo" && \
    cd "${GOPATH}/src/github.com/aacebedo" && \
    git clone --depth 1 --branch ${VERSION} https://github.com/ailispaw/dnsdock && \
    \
    cd dnsdock && \
    "${GOPATH}/bin/godep" restore && \
    cd src && \
    "${GOPATH}/bin/govvv" build -o /usr/bin/dnsdock -ldflags "-w -s" && \
    \
    apk del build-deps && \
    rm -rf /usr/lib/go && \
    rm -rf "${GOPATH}" && \
    rm -rf /tmp/* /var/cache/apk/*

ENTRYPOINT [ "dnsdock" ]
