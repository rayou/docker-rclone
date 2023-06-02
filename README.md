[github]: https://github.com/rayou/docker-rclone
[app-github]: https://github.com/ncw/rclone
[dockerstore]: https://hub.docker.com/r/rayou/rclone
[donation]: https://www.buymeacoffee.com/rayou

# docker-rclone
[![](https://img.shields.io/docker/image-size/rayou/rclone?sort=semver)][dockerstore] [![](https://img.shields.io/docker/v/rayou/rclone?sort=semver)][dockerstore] [![](https://img.shields.io/docker/stars/rayou/rclone)][dockerstore] [![](https://img.shields.io/badge/☕️-Buy%20Me%20A%20Coffee-important.svg)][donation]

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

<a href="https://www.buymeacoffee.com/rayou" target="_blank" rel="noopener noreferrer"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" width="280" /></a>

# License

MIT.
