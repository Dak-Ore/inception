ARG DEBIAN_VERSION
FROM debian:${DEBIAN_VERSION:-bullseye-slim}

RUN apt-get update && apt-get install -y \
    vsftpd &&\
    apt clean && \
    rm -rf /var/lib/apt/lists/*

COPY conf/vsftpd.conf /etc/vsftpd.conf

COPY conf/init.sh /init.sh
RUN chmod +x /init.sh

EXPOSE 20 21 21100-21110

RUN mkdir -p /var/run/vsftpd/empty &&\
    chown root:root /var/run/vsftpd/empty && \
    chmod 555 /var/run/vsftpd/empty

ENTRYPOINT ["/init.sh"]