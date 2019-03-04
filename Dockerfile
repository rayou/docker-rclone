FROM alpine:3.9 as base

FROM base as builder
ARG VERSION=v1.45

RUN wget https://github.com/ncw/rclone/releases/download/$VERSION/rclone-$VERSION-linux-amd64.zip
RUN unzip rclone-$VERSION-linux-amd64.zip
RUN cd rclone-*-linux-amd64 && \
    cp rclone /usr/bin/ && \
    chown root:root /usr/bin/rclone && \
    chmod 755 /usr/bin/rclone

FROM base

RUN apk --update --no-cache add ca-certificates inotify-tools
COPY --from=builder /usr/bin/rclone /usr/bin/rclone

ENTRYPOINT ["/usr/bin/rclone"]
