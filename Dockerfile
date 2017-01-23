FROM ubuntu:14.04.5

MAINTAINER FXinnovation

VOLUME /data

ENV CHEF_VERSION=1.1.16

ADD ./resources /resources

RUN /resources/build && rm -rf /resources

WORKDIR /data
