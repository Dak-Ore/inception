ARG DEBIAN_VERSION
FROM debian:${DEBIAN_VERSION:-bullseye-slim}

RUN		apt-get update -y && \
		apt-get install -y wget unzip less netcat curl sudo php7.4 php7.4-fpm php7.4-mysql php7.4-gd php7.4-xml php7.4-curl php7.4-mbstring php7.4-zip mariadb-client && \
		apt-get clean && \
		rm -rf /var/lib/apt/lists/*

RUN wget https://fr.wordpress.org/wordpress-6.8.1-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.8.1-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz
RUN	chown -R root:root /var/www/wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/w

COPY conf/init.sh /
RUN chmod +x init.sh

EXPOSE 9000

ENTRYPOINT ["bash", "init.sh"]