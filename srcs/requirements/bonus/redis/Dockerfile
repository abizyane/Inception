FROM debian:bullseye

RUN apt update && apt full-upgrade -y;\
    apt install -y redis-server;\
    apt clean

COPY ./conf/redis.conf /usr/local/etc/redis/redis.conf

CMD [ "redis-server", "/usr/local/etc/redis/redis.conf" ]

