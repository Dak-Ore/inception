#!/bin/bash

cd /var/www/wordpress

echo "Testing database connection..."
echo "    - User: $MDB_USER"
echo "    - Database: mariadb"
echo "    - Host: $MDB_NAME"

echo "Database connection successful!"

until mysqladmin -h"mariadb" -u"$MDB_USER" -p"$MDB_USER_PASS" ping &>/dev/null; do
    echo "Waiting for MariaDB... (Trying to connect as $MDB_USER)"
    sleep 5
done

if [ ! -f wp-config.php ]; then
	echo "Creating wp-config.php..."

	wp config create \
		--dbname="$MDB_NAME" \
		--dbuser="$MDB_USER" \
		--dbpass="$MDB_USER_PASS"\
		--dbhost="mariadb" \
		--path=/var/www/wordpress \
		--allow-root

	wp core install \
		--url="$DOMAIN_NAME" \
		--title="$WEBSITE_TITLE" \
		--admin_user="$WP_ADMIN_LOGIN" \
		--admin_password="$WP_ADMIN_PASSWORD" \
		--admin_email="$WP_ADMIN_EMAIL" \
		--skip-email \
		--allow-root

	wp user create "$WP_USER_LOGIN" "$WP_USER_EMAIL" \
		--role=author \
		--user_pass="$WP_USER_PASSWORD" \
		--allow-root

	echo "WordPress successfully installed."
else
	echo "WordPress is already configured."
fi

echo "Launching PHP-FPM..."
exec /usr/sbin/php-fpm7.4 -F
