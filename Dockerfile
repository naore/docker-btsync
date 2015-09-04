FROM linuxserver/baseimage
MAINTAINER LinuxServer.io - IronicBadger <docker@linuxserver.io>

# btsync specifics
RUN curl -o /app/btsync.tar.gz https://download-cdn.getsync.com/stable/linux-x64/BitTorrent-Sync_x64.tar.gz && \
cd /app && tar -xzvf btsync.tar.gz && rm btsync.tar.gz && mv /app/btsync /app/btsync-latest && \
curl -o /app/btsync.tar.gz http://syncapp.bittorrent.com/1.4.111/btsync_x64-1.4.111.tar.gz && \
tar -xzvf btsync.tar.gz && rm btsync.tar.gz && mv /app/btsync /app/btsync-1.4 && \
apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#Adding Custom files
ADD defaults/ /defaults/
ADD init/ /etc/my_init.d/
ADD services/ /etc/service/
RUN chmod -v +x /etc/service/*/run
RUN chmod -v +x /etc/my_init.d/*.sh


# Mappings and Ports
EXPOSE 8888 55555
VOLUME /btsync
