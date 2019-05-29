FROM naore/btsync:stable
#as builder
#FROM ubuntu:18.04
MAINTAINER naore
#COPY --from=builder /* /*
ENV HOME="/mnt/point"
