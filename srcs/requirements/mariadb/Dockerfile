ARG DEBIAN_VERSION
FROM debian:${DEBIAN_VERSION:-bullseye-slim}
ARG PKG="mariadb-server"
ARG TMP_PKG=""
# RUN adduser --disabled-password --gecos "" app
# USER app
ENV DB_NAME=${DB_NAME}
ENV DB_USER=${DB_USER}
ENV DB_ROOT_PASS=${DB_ROOT_PASS}
ENV DB_USER_PASS=${DB_USER_PASS}

RUN apt -y update && apt -y install --no-install-recommends ${PKG}

# RUN usermod -u 9999 mysql && groupmod -g 9999 mysql
RUN mkdir -p /var/lib/mysql
# && chown :mysql /var/lib/mysql && chmod 770 /var/lib/mysql

EXPOSE 3306

HEALTHCHECK --interval=3s --timeout=3s --retries=5 \
CMD mysqladmin ping --silent || exit 1

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY conf/init.sh /init.sh
RUN chmod +x /init.sh  
RUN apt remove -y ${TMP_PKG} && apt clean && rm -rf /var/lib/apt/lists/*
ENTRYPOINT [ "/init.sh" ]