FROM phusion/baseimage:0.9.13
MAINTAINER Stian Larsen <lonixx@gmail.com>
RUN rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh
ENV DEBIAN_FRONTEND noninteractive
ENV HOME /root


# Use baseimage-docker's init system
CMD ["/sbin/my_init"]


#btsync spesific
RUN curl -o /usr/bin/btsync.tar.gz http://download.getsyncapp.com/endpoint/btsync/os/linux-x64/track/stable
RUN cd /usr/bin && tar -xzvf btsync.tar.gz && rm btsync.tar.gz


#mappings and ports
EXPOSE 8888
EXPOSE 55555
VOLUME /btsync


#Add Btsync execution
RUN mkdir /etc/service/btsync
ADD btsync.conf /etc/btsync.conf
ADD checkSync.init /etc/my_init.d/00_checkSync.sh
ADD btsync.sh /etc/service/btsync/run
RUN chmod +x /etc/service/btsync/run 
RUN chmod +x /etc/my_init.d/00_checkSync.sh


#Cleanup
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
