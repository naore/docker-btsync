FROM ubuntu:14.04
MAINTAINER Stian Larsen <lonixx@gmail.com>
RUN apt-get update && apt-get install -y curl
RUN curl -o /usr/bin/btsync.tar.gz http://download-lb.utorrent.com/endpoint/btsync/os/linux-x64/track/stable
RUN cd /usr/bin && tar -xzvf btsync.tar.gz && rm btsync.tar.gz
RUN mkdir -p /btsync/.sync
ADD btsync.conf /etc/btsync.conf
EXPOSE 8888
EXPOSE 55555
VOLUME /btsync
ENTRYPOINT ["btsync"]
CMD ["--config", "/etc/btsync.conf", "--nodaemon"]
