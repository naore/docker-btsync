FROM phusion/baseimage:0.9.15
MAINTAINER Stian Larsen <lonixx@gmail.com>
RUN rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh
ENV DEBIAN_FRONTEND noninteractive
ENV HOME /root


# Use baseimage-docker's init system
CMD ["/sbin/my_init"]


#btsync spesific
RUN curl -o /usr/bin/btsync.tar.gz http://download.getsyncapp.com/endpoint/btsync/os/linux-x64/track/stable && \
cd /usr/bin && tar -xzvf btsync.tar.gz && rm btsync.tar.gz && \
apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


#mappings and ports
EXPOSE 8888
EXPOSE 55555
VOLUME /btsync


ADD btsync.conf /etc/btsync.conf

#Adding Custom files
ADD init/ /etc/my_init.d/
ADD services/ /etc/service/
RUN chmod -v +x /etc/service/*/run
RUN chmod -v +x /etc/my_init.d/*.sh

