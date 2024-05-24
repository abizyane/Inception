FROM debian:bullseye

RUN apt update && apt upgrade;\
        apt install -y mariadb-server ;\
        apt install -y netcat;\
        apt clean

COPY  /tools/setup.sh /start.sh

CMD ["bash", "/start.sh"]
