FROM debian:bullseye

RUN apt update && apt full-upgrade -y &&\
    apt install -y wget\
    tar &&\
    wget https://github.com/portainer/portainer/releases/download/2.19.5/portainer-2.19.5-linux-amd64.tar.gz &&\
    tar -xvf portainer-2.19.5-linux-amd64.tar.gz &&\
    rm -rf portainer-2.19.5-linux-amd64.tar.gz &&\
    apt clean

COPY tools/setup.sh /start.sh

RUN chmod +x /start.sh

CMD ["bash", "/start.sh"]
