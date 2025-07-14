ARG DEBIAN_VERSION
FROM debian:${DEBIAN_VERSION:-bullseye-slim}

RUN apt-get update && apt-get install -y \
    vsftpd &&\
    apt clean && \
    rm -rf /var/lib/apt/lists/*

COPY conf/vsftpd.conf /vsftpd.conf

COPY conf/init.sh /init.sh
RUN chmod +x /init.sh

RUN mkdir -p /var/run/vsftpd/empty

ENTRYPOINT ["/init.sh"]