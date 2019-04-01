# Build
```bash
$ docker build --build-arg VERSION=$RCLONE_VERSION -t rclone .
# docker build --build-arg VERSION=v1.45 -t rclone .
```

# Usage
`Rclone` is defined generically through the container environment.
To find the name of the environment variable, first, take the long option name,
strip the leading --, change - to _ make upper case and prepend RCLONE_.
All available endpoints are described in the [official rclone documentation](https://rclone.org/commands/rclone_move/)
of each command.

### Run `rclone` (default entrypoint)
```bash
$ docker run --rm -it travelping/rclone:latest --help
```

### Run `rclone` (sftp)
This configuration provides a simple functionality test by enhancing the default entrypoint (`usr/bin/rclone`).
Running a touch command on the remote path of a sftp server can be done entirely through environment.
```bash
docker run --rm -it -e RCLONE_CONFIG_SFTP_TYPE=sftp \
-e RCLONE_CONFIG_SFTP_HOST=host.com \
-e RCLONE_CONFIG_SFTP_USER=name \
-e RCLONE_CONFIG_SFTP_PORT=23 \
-e RCLONE_CONFIG_SFTP_PASS=password travelping/rclone:v1.0 touch sftp:path
```

### Run `rclone` (s3)
This configuration provides a simple functionality test by enhancing the default entrypoint (`usr/bin/rclone`).
Running a touch command on the remote path of a s3 bucket can be done entirely through environment.

```bash
docker run --rm -it -e RCLONE_CONFIG_S3_TYPE: "s3" \
-e RCLONE_CONFIG_S3_ENV_AUTH: "false" \
-e RCLONE_CONFIG_S3_ACCESS_KEY_ID: "<sensitive>" \
-e RCLONE_CONFIG_S3_SECRET_ACCESS_KEY: "<sensitive>" \
-e RCLONE_CONFIG_S3_REGION: "s3-<region>" \
-e RCLONE_CONFIG_S3_ACL: "private" \
    RCLONE_CONFIG_S3_FORCE_PATH_STYLE: "false" travelping/rclone:v1.0 touch sftp:path
```

### Run shell
```bash
$ docker run --rm -it --entrypoint=/bin/sh travelping/rclone:latest
```

# Inotify
Besides `rclone` this container also features `inotify`. Watchpatterns can be used to make sure only finished files
are being transfered. This is important so no garbage-data is moved (e.g. traces still beeing captured).
All inotify-events for a directory `/data/` can be neatly logged using this command:
```
inotifywait -mr --timefmt '%H:%M' --format '%T %w %e %f' /data/
```

## Inotify-Script
Wating for the `close_write` event, this command only pushes "finished" data to the destination.
```
watchnames=''
[ -d /data/ ] && watchnames="$watchnames /data/"
inotifywait --monitor -e close_write --format %w%f $watchnames | while read FILE
do
  echo "$FILE is finished. Moving to data/finished/"
  mv $FILE/ data/finished/
  rclone move /data/finished/ $RCLONE_REMOTE_NAME:RCLONE_REMOTE_PATH/
done
```

Endpoints checked:
- [x] SFTP
- [X] Onedrive
- [X] S3
