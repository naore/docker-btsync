FROM linuxserver/baseimage
MAINTAINER LinuxServer.io - IronicBadger <docker@linuxserver.io>

# fetch btsync packages

# stable
 RUN curl -o /tmp/btsync_stable.tar.gz -L https://download-cdn.getsync.com/stable/linux-x64/BitTorrent-Sync_x64.tar.gz && \
 mkdir -p /app/btsync-latest && \
 tar -xzvf /tmp/btsync_stable.tar.gz -C /app/btsync-latest --strip-components=1 && \
# legacy
 curl -o /tmp/btsync_legacy.tar.gz -L http://syncapp.bittorrent.com/1.4.111/btsync_x64-1.4.111.tar.gz && \
 mkdir -p /app/btsync-1.4 && \
 tar -xzvf /tmp/btsync_legacy.tar.gz -C /app/btsync-1.4 --strip-components=1 && \

# cleanup
rm -rf /tmp/*

#Adding Custom files
ADD defaults/ /defaults/
ADD init/ /etc/my_init.d/
ADD services/ /etc/service/
RUN chmod -v +x /etc/service/*/run /etc/my_init.d/*.sh

# Mappings and Ports
EXPOSE 8888 55555
VOLUME /btsync

