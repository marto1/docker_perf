FROM ubuntu:xenial

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y python3 python3-dev && \
    apt-get autoremove --purge -y && \
    apt-get clean


COPY virt_common/ /virt_common