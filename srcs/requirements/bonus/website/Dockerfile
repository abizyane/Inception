FROM debian:bullseye

RUN apt update && apt full-upgrade -y;\
    apt install -y nginx;\
    apt clean

COPY ./conf/nginx.conf /etc/nginx/sites-available/default

COPY ./tools/ /var/www/html/

CMD ["nginx", "-g", "daemon off;"]
