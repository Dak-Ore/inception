ARG DEBIAN_VERSION
FROM debian:${DEBIAN_VERSION:-bullseye-slim}

ENV DB_NAME=${MDB_NAME}
ENV DB_USER=${MDB_USER}
ENV DB_ROOT_PASS=${MDB_ROOT_PASS}
ENV DB_USER_PASS=${MDB_USER_PASS}

RUN		apt -y update && \
    	apt -y install --no-install-recommends mariadb-server && \
		apt clean && \
		rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/lib/mysql && chown mysql:mysql /var/lib/mysql && chmod 750 /var/lib/mysql

EXPOSE 3306

HEALTHCHECK --interval=10s --timeout=5s --retries=5 \
	CMD mysqladmin ping --silent || exit 1

COPY conf/init.sh /init.sh
RUN chmod +x /init.sh

RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

ENTRYPOINT [ "/init.sh" ]