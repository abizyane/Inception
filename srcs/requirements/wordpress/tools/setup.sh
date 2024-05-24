#!/usr/bin/env bash


curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

cd /var/www

wp core download --allow-root


until mysqladmin ping -h"$WP_HOST" --silent; do
  echo "Waiting for database connection..."
  sleep 3
done

wp config create --force --dbhost="$WP_HOST" --dbname="$MYSQL_DATABASE" --dbuser="$MYSQL_USER" --dbpass="$MYSQL_PASSWORD" --allow-root

if ! wp core is-installed --allow-root; then
  wp core install --url="$DOMAIN_NAME" --title="$WP_TITLE" --admin_user="$WP_USER" --admin_password="$WP_PASSWORD" --admin_email="$WP_EMAIL" --allow-root
fi

if ! wp user get "$WP_N_USER" --field=ID --allow-root > /dev/null 2>&1; then
  wp user create "$WP_N_USER" "$WP_N_EMAIL" --user_pass="$WP_N_PASSWORD" --role="$WP_N_ROLE" --allow-root
fi

sed -i '36 s@/run/php/php7.4-fpm.sock@9000@' /etc/php/7.4/fpm/pool.d/www.conf

mkdir -p /run/php

/usr/sbin/php-fpm7.4 -F