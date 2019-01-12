[app-github]: https://github.com/ncw/rclone
[microbadger]: https://microbadger.com/images/rayou/rclone
[dockerstore]: https://hub.docker.com/r/rayou/rclone

# docker-rclone
[![](https://images.microbadger.com/badges/image/rayou/rclone.svg)][microbadger] [![](https://images.microbadger.com/badges/version/rayou/rclone.svg)][microbadger] [![](https://img.shields.io/docker/stars/rayou/rclone.svg)][dockerstore]

Docker image of [rclone][app-github].

Repository name in Docker Hub: [rayou/rclone][dockerstore]

# Build
```bash
$ docker build --build-arg VERSION=$RCLONE_VERSION -t rclone .
# docker build --build-arg VERSION=v1.45 -t rclone .
```

# Usage

### Run `rclone` directly
```bash
$ docker run --rm -it rayou/rclone:latest --help
```

### Run shell
```bash
$ docker run --rm -it --entrypoint=/bin/sh rayou/rclone:latest
```

# Documentation
- https://rclone.org/docs/