FROM phusion/baseimage:0.9.13
MAINTAINER Stian Larsen <lonixx@gmail.com>

RUN apt-get update && apt-get install -y curl
RUN curl -o /usr/bin/btsync.tar.gz http://download.getsyncapp.com/endpoint/btsync/os/linux-x64/track/stable
RUN cd /usr/bin && tar -xzvf btsync.tar.gz && rm btsync.tar.gz
RUN mkdir -p /btsync/.sync
ADD btsync.conf /etc/btsync.conf



EXPOSE 8888
EXPOSE 55555
VOLUME /btsync


#Startup
CMD ["/sbin/my_init"]

#Add Btsync execution
RUN mkdir /etc/service/btsync
ADD startup.init /etc/my_init.d/startup.sh
ADD btsync.sh /etc/service/btsync/run
RUN chmod +x /etc/service/btsync/run 
RUN chmod +x /etc/my_init.d/startup.sh
#Cleanup
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
