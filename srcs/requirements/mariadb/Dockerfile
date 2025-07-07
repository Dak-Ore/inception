ARG DEBIAN_VERSION
FROM debian:${DEBIAN_VERSION:-bullseye-slim}

RUN		apt -y update && \
    	apt -y install mariadb-server && \
		apt clean && \
		rm -rf /var/lib/apt/lists/*

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE 3306

COPY conf/init.sh /

RUN chmod +x init.sh

ENTRYPOINT ["bash", "init.sh"]