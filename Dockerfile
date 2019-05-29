FROM naore/btsync:stable
#as builder
#FROM ubuntu:18.04
MAINTAINER naore
#COPY --from=builder /* /*
RUN rm -rf /app/btsync-1.4
ENV HOME="/mnt/point"
