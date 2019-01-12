# docker-rclone
Docker image of [rclone](https://github.com/ncw/rclone).

Repository name in Docker Hub: [rayou/rclone](https://hub.docker.com/r/rayou/rclone)

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