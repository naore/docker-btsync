
## Usage

```
docker create \
	--name=btsync \
	-v <path to config dir>:/config \
	-v <path to sync data>:/mnt/point \
	-e PGID=<gid> -e PUID=<uid> \
	-p 8888:8888 \
	-p 55555:55555 \
	linuxserver/btsync
```

**Parameters**

* `-p 8888` - the port sync listens for connections on for webUI
* `-p 55555` - the port sync listens for connections on for Torrent traffic
* `-v /config` - configuration storage
* `-v /mnt/point` - to be replaced with the locations you wish to make available to Sync
* `-e PGID` for for GroupID - see below for explanation
* `-e PUID` for for UserID - see below for explanation

### User / Group Identifiers

**TL;DR** - The `PGID` and `PUID` values set the user / group you'd like your container to 'run as' to the host OS. This can be a user you've created or even root (not recommended).

Part of what makes our containers work so well is by allowing you to specify your own `PUID` and `PGID`. This avoids nasty permissions errors with relation to data volumes (`-v` flags). When an application is installed on the host OS it is normally added to the common group called users, Docker apps due to the nature of the technology can't be added to this group. So we added this feature to let you easily choose when running your containers.  
