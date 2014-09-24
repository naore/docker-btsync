docker-btsync
=============

sample command: 
docker run -d -p 8888:8888 -p 55555:55555 -v /mnt/data/sync/:/btsync/ lonix/docker-btsync

* Port 8888 for webUI
* Port 55555 for TorrentTraffic
* Mount /btsync for storagearea 

*You may need to create the .sync subfolder yourself the first time*
