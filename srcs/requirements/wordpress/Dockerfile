FROM debian:bullseye

RUN apt update && apt upgrade;\
        apt install -y curl;\
        apt install -y php7.4 &&\
	apt install -y php7.4-fpm &&\
	apt install -y php7.4-mysql &&\
	apt install -y mariadb-client;\
        apt clean;\
        mkdir -p /var/www/wordpress &&\
        chmod -R 755 /var/www/wordpress &&\
        chown -R www-data:www-data /var/www/wordpress

COPY  /tools/setup.sh /start.sh

CMD ["bash", "/start.sh"]
