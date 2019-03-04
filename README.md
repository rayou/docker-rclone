# Build
```bash
$ docker build --build-arg VERSION=$RCLONE_VERSION -t rclone .
# docker build --build-arg VERSION=v1.45 -t rclone .
```

# Usage
Besides `rclone` this container also features `inotify`.
### Run `rclone` (default entrypoint)
```bash
$ docker run --rm -it travelping/rclone:latest --help
```

### Run shell
```bash
$ docker run --rm -it --entrypoint=/bin/sh travelping/rclone:latest
```


## Debugging
All inotify-events can be neatly logged using this command:
```
inotifywait -mr --timefmt '%H:%M' --format '%T %w %e %f' /data/"
```

## Script

Wating for the `close_write` event, this command only pushes "finished" data to the destination.
```
watchnames=''
[ -d /data/ ] && watchnames="$watchnames /data/"
inotifywait --monitor -e close_write --format %w%f $watchnames | while read FILE
do
  echo "$FILE is finished. Moving to data/finished/"
  mv $FILE/ data/finished/
  rclone move /data/finished/ onedrive:data/
done
```

Endpoints checked:
- [x] SFTP
- [X] Onedrive
- [ ] S3
