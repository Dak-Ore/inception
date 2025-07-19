ARG DEBIAN_VERSION
FROM debian:${DEBIAN_VERSION:-bullseye-slim}

# Installer Node.js 20
RUN apt update -y && \
    apt-get install -y curl ca-certificates gnupg && \
    curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

# Créer le dossier de l'app
WORKDIR /var/www/vraiment_static

# Copier les fichiers de dépendances en premier (cache build efficace)
COPY vraiment_static/package*.json ./

# Installer les dépendances
RUN npm install

# Copier tout le reste
COPY vraiment_static ./

EXPOSE 3000

# Lancer Nuxt en dev
ENTRYPOINT ["npm", "run", "dev"]
