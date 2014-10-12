lonix/btsync
=============

sample command: 
```
docker run -d -p 8888:8888 -p 55555:55555 -v /mnt/data/sync/:/btsync/ lonix/btsync:1.3
```
* Port 8888 for webUI
* Port 55555 for TorrentTraffic
* Mount /btsync for storagearea 
