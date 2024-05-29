FROM debian:bullseye

RUN apt update && apt full-upgrade -y;\
        apt install -y curl\
        php7.4\
	php7.4-fpm\
	php7.4-mysql\
	mariadb-client;\
        apt clean;\
        mkdir -p /var/www/wordpress &&\
        chmod -R 755 /var/www/wordpress &&\
        chown -R www-data:www-data /var/www/wordpress

COPY  /tools/setup.sh /start.sh

CMD ["bash", "/start.sh"]
