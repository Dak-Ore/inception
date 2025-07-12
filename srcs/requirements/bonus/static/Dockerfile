ARG DEBIAN_VERSION
FROM debian:${DEBIAN_VERSION:-bullseye-slim}

RUN		apt update -y && \
		apt clean && \
		rm -rf /var/lib/apt/lists/*

COPY conf /var/www/static
