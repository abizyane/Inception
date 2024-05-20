FROM debian:bullseye

RUN apt update && apt upgrade;\
        apt install -y nginx &&\
        apt install openssl;\
        apt clean;\
        mkdir /etc/nginx/ssl &&\
        openssl req -x509 -nodes -newkey rsa:2048 -keyout\
        /etc/nginx/ssl/inception.key -out /etc/nginx/ssl/inception.crt -subj "/CN=localhost"

COPY  ./conf/nginx.conf /etc/nginx/sites-available/default

COPY  ./tools/index.html /var/www/html/index.html

CMD ["nginx", "-g", "daemon off;"]