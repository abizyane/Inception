FROM debian:bullseye

RUN apt update && apt full-upgrade -y;\
        apt install -y nginx\
        openssl;\
        apt clean;\
        mkdir /etc/nginx/ssl &&\
        openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout\
        /etc/nginx/ssl/inception.key -out /etc/nginx/ssl/inception.crt -subj "/CN=abizyane.42.fr/O=42/OU=1337/C=MO/L=KHOURIBGA";
        
COPY  ./conf/nginx.conf /etc/nginx/sites-available/default

CMD ["nginx", "-g", "daemon off;"]
