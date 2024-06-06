FROM debian:bullseye

RUN apt update && apt full-upgrade -y &&\
    apt install -y postfix\
    swaks

COPY tools/setup.sh /start.sh

CMD ["/bin/bash", "/start.sh"]
