[github]: https://github.com/rayou/docker-rclone
[app-github]: https://github.com/ncw/rclone
[microbadger]: https://microbadger.com/images/rayou/rclone
[dockerstore]: https://hub.docker.com/r/rayou/rclone
[donation]: https://donorbox.org/rayou?amount=10

# docker-rclone
[![](https://images.microbadger.com/badges/image/rayou/rclone.svg)][microbadger] [![](https://images.microbadger.com/badges/version/rayou/rclone.svg)][microbadger] [![](https://img.shields.io/docker/stars/rayou/rclone.svg)][dockerstore] [![](https://img.shields.io/badge/Donate-Donorbox-green.svg)][donation]

Docker image of [rclone][app-github].

Repository name in Docker Hub: [rayou/rclone][dockerstore]

Repository name in Github: [rayou/docker-rclone][github]

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

# Contributing

PRs are welcome.

# Author

Ray Ou - yuhung.ou@live.com

# Donation

[![](https://d1iczxrky3cnb2.cloudfront.net/button-small-green.png)][donation]

# License

MIT.