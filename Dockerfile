FROM naore/btsync:stable
MAINTAINER naore 
RUN rm -rf /app/btsync-latest
ENV HOME="/mnt/point"
