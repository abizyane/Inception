FROM debian:bullseye

RUN apt update && apt full-upgrade -y;\
    apt install -y wget\
    php\
    php-mysql &&\
    apt clean

RUN mkdir -p /var/www/html &&\
    wget -O /var/www/html/adminer.php https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php
    
COPY ./tools/adminer.css /var/www/html/adminer.css

CMD ["php", "-S", "0.0.0.0:8080", "-t", "/var/www/html/"]