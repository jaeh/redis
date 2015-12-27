#
# magic/redis Dockerfile
#
# https://github.com/dockerfile/redis
#

FROM alpine:edge

MAINTAINER Wizards@Work <dev@wizardsat.work>
ENV REFRESHED_AT 2015-27-12

RUN echo "http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

RUN apk update

RUN \
  apk add \
    --update
    redis

RUN rm -rf /var/cache/apk/*

# add and use wizard user
RUN adduser -h /home/wizard -s /bin/sh -u 40561 -D wizard wizard
USER wizard

# Define working directory.
WORKDIR /data

# use the local redis conf for the container
ADD ./redis.conf /etc/redis/redis.conf

# Define default command.
CMD ["redis-server", "/etc/redis/redis.conf"]

# Expose ports.
EXPOSE 6379
