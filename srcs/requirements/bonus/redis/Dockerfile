ARG DEBIAN_VERSION
FROM debian:${DEBIAN_VERSION:-bullseye-slim}

RUN		apt update -y && \
        apt-get install -y redis && \
		apt clean && \
		rm -rf /var/lib/apt/lists/*

COPY conf/redis.sh /redis.sh
RUN chmod +x /redis.sh

EXPOSE 6379

ENTRYPOINT ["/redis.sh"]
