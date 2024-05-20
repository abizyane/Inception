FROM debian:bullseye

RUN apt update && apt upgrade;\
        apt install -y wget &&\
        apt install -y php7.3 &&\
	apt install -y php-fpm &&\
	apt install -y php-mysql &&\
	apt install -y mariadb-client;\
        apt clean;\
        wget https://wordpress.org/wordpress-6.5.tar.gz -P /var/www;\
        cd /var/www && tar -xvf wordpress-6.5.tar.gz && rm -rf wordpress-6.5.tar.gz;\
        chown -R root:root /var/www/wordpress;\
        chmod -R 755 /var/www/wordpress

# COPY  ./conf/wp-config.php /var/www/wordpress/wp-config.php

# CMD ["php-fpm7.3", "-F"]

