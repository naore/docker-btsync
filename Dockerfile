FROM linuxserver/baseimage
MAINTAINER LinuxServer.io - IronicBadger <docker@linuxserver.io>

# btsync specifics
RUN curl -o /usr/bin/btsync.tar.gz https://download-cdn.getsync.com/stable/linux-x64/BitTorrent-Sync_x64.tar.gz && \
cd /usr/bin && tar -xzvf btsync.tar.gz && rm btsync.tar.gz && \
apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


# Config file
ADD btsync.conf /etc/btsync.conf

#Adding Custom files
ADD init/ /etc/my_init.d/
ADD services/ /etc/service/
RUN chmod -v +x /etc/service/*/run
RUN chmod -v +x /etc/my_init.d/*.sh


# Mappings and Ports
EXPOSE ["8888","55555"]
VOLUME /btsync