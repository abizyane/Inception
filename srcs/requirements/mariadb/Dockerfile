FROM debian:bullseye

RUN apt update && apt upgrade;\
        apt install -y mariadb-server ;\
        apt clean
        # apt install -y netcat;\

COPY  /tools/setup.sh /start.sh

CMD ["bash", "/start.sh"]
