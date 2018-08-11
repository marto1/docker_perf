FROM sal:5000/daa/presto-origin

ENV DEBIAN_FRONTEND noninteractive

# dependency for presto-server
RUN apt-get update && \
    apt-get install -y python && \
    apt-get autoremove --purge -y && \
    apt-get clean


COPY virt_common/ /virt_common