ARG DEBIAN_VERSION
FROM debian:${DEBIAN_VERSION:-bullseye-slim}

RUN		apt update -y && \
		apt install -y nginx openssl curl gettext-base && \
		apt clean && \
		rm -rf /var/lib/apt/lists/*

ARG LOGIN
ARG DOMAIN_NAME

ENV SSL_CRT=/etc/nginx/ssl/inception.crt
ENV SSL_KEY=/etc/nginx/ssl/inception.key

# CREATE DIRECTORY FOR OPENSSL CERTIFICATE
RUN mkdir -p /etc/nginx/ssl /www

RUN openssl req -x509 -nodes -days 365 \
	-out ${SSL_CRT} \
	-keyout ${SSL_KEY} \
	-subj "/C=FR/ST=IDF/L=Perpignan/O=42/OU=42/CN=${DOMAIN_NAME}/UID=${LOGIN}"

COPY conf/nginx.conf /etc/nginx/nginx.conf
RUN chmod 755 /var/www/html
# RUN chown -R www-data:www-data /var/www/html
		
EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]