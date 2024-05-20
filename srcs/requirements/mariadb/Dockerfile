FROM debian:bullseye

RUN apt update && apt upgrade;\
        apt install -y mariadb-server ;\
        apt clean

COPY  ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY  /tools/setup.sh /start.sh

CMD ["bash", "/start.sh"]
