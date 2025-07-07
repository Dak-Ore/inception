#!/bin/bash

service mysql start;
mysql -e "CREATE DATABASE IF NOT EXISTS \`${MARIADB_NAME}\`;"
mysql -e "CREATE USER IF NOT EXISTS \`${MARIADB_USER_LOGIN}\`@'localhost' IDENTIFIED BY '${MARIADB_USER_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${MARIADB_NAME}\`.* TO \`${MARIADB_USER_LOGIN}\`@'%' IDENTIFIED BY '${MARIADB_USER_PASSWORD}';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}';"
mysql -e "FLUSH PRIVILEGES;"
mysqladmin -u root -p$MARIADB_ROOT_PASSWORD shutdown
exec mysqld_safe