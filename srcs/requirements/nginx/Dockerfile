ARG DEBIAN_VERSION
FROM debian:${DEBIAN_VERSION:-bullseye-slim}

RUN		apt-get update -y && \
		apt-get install -y nginx openssl curl && \
		apt-get clean && \
		rm -rf /var/lib/apt/lists/*

		
# CREATE DIRECTORY FOR OPENSSL CERTIFICATE
ARG PATH_NGINX_CERTIFICATE
RUN mkdir -p ${PATH_NGINX_CERTIFICATE}
RUN openssl req -x509 -nodes -out ${PATH_NGINX_CERTIFICATE}/inception.crt -keyout ${PATH_NGINX_CERTIFICATE}/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=rsebasti.42.fr/UID=rsebasti"

# CREATE DIRECTORY FOR NGINX CONF
ARG PATH_NGINX_CONF
RUN mkdir -p ${PATH_NGINX_CONF}
COPY conf/nginx.conf /etc/nginx/nginx.conf
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html
		
EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]