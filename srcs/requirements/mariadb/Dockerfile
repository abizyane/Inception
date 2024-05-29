FROM debian:bullseye

RUN apt update && apt full-upgrade -y;\
        apt install -y mariadb-server ;\
        apt clean

COPY  /tools/setup.sh /start.sh

CMD ["bash", "/start.sh"]
