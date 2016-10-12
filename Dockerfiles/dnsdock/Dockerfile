FROM armhf/alpine:3.4

ARG VERSION="1.15.0"
ENV GOPATH="/tmp/go"

RUN apk --no-cache add --virtual build-deps go make git && \
    go get github.com/tools/godep && \
    cd "$GOPATH/src/github.com" && \
    git clone --depth 1 --branch $VERSION https://github.com/ailispaw/dnsdock && \
    cd dnsdock && \
    "$GOPATH/bin/godep" restore && \
    cd src && \
    "$GOPATH/bin/godep" go build -o /usr/bin/dnsdock \
      -ldflags "-w -s -X main.version=`git describe --tags HEAD`" && \
    apk del build-deps && \
    rm -rf "$GOPATH"

ENTRYPOINT [ "dnsdock" ]
