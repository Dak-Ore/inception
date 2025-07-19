ARG DEBIAN_VERSION
FROM debian:${DEBIAN_VERSION:-bullseye-slim}

ARG NGROK_VERSION=3.9.0

# Dépendances pour curl et unzip
RUN apt update && apt install -y curl unzip ca-certificates && \
    curl -L https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v${NGROK_VERSION}-linux-amd64.zip -o /tmp/ngrok.zip && \
    unzip /tmp/ngrok.zip -d /usr/local/bin && \
    chmod +x /usr/local/bin/ngrok && \
    rm -rf /var/lib/apt/lists/* /tmp/*

# Token et tunnel config via .env
ENV NGROK_AUTHTOKEN=""
ENV NGROK_PORT=80

# Expose uniquement l'interface Web UI de ngrok (4040)
EXPOSE 4040

ENTRYPOINT ["/usr/local/bin/ngrok"]
CMD ["http", "--log", "stdout", "static:3000"]

