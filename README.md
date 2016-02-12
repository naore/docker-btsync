![http://linuxserver.io](http://www.linuxserver.io/wp-content/uploads/2015/06/linuxserver_medium.png)

The [LinuxServer.io](http://linuxserver.io) team brings you another quality container release featuring auto-update on startup, easy user mapping and community support. Be sure to checkout our [forums](http://forum.linuxserver.io) or for real-time support our [IRC](http://www.linuxserver.io/index.php/irc/) on freenode at `#linuxserver.io`.

# linuxserver/btsync

![btsync](http://static3.actualidadipad.com/wp-content/uploads/2013/08/BitTorrent-Sync.jpg)

[BitTorrent Sync](https://www.getsync.com/) is fast, private file sharing for teams and individuals using the BitTorrent protocol.

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

## Miscellaneous

* Upgrade to the latest version of BitTorrent Sync simply `docker restart btsync`.
* Monitor the logs of the container in realtime `docker logs -f btsync`.
* Attach to shell of running instance `docker exec -it btsync bash`.

## Versions

* 01.09.15: Updated and brought inline with LinuxServer policies
* 1.0: Inital release by Lonix
