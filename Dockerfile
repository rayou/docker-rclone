FROM alpine:3.11.3 as base

## build-stage

FROM base as builder
ARG VERSION=v1.50.2

RUN wget https://github.com/ncw/rclone/releases/download/$VERSION/rclone-$VERSION-linux-amd64.zip
RUN unzip rclone-$VERSION-linux-amd64.zip
RUN cd rclone-*-linux-amd64 && \
    cp rclone /usr/bin/ && \
    chown root:root /usr/bin/rclone && \
    chmod 755 /usr/bin/rclone

##
## runtime-stage

FROM base

ARG VERSION=v1.50.2

## https://github.com/opencontainers/image-spec/releases/tag/v1.0.1
LABEL org.opencontainers.image.url="https://github.com/travelping/docker-rclone"
LABEL org.opencontainers.image.source="https://github.com/travelping/docker-rclone"
LABEL org.opencontainers.image.version=$VERSION
LABEL org.opencontainers.image.vendor="travelping.com"
LABEL org.opencontainers.image.title="rclone-$VERSION"
LABEL org.opencontainers.image.description="rclone - rsync for cloud storage"

RUN apk --update --no-cache add \
        ca-certificates \
        inotify-tools \
        lz4 zstd
COPY --from=builder /usr/bin/rclone /usr/bin/rclone

ENTRYPOINT ["/usr/bin/rclone"]
