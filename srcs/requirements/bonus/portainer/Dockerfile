FROM debian:bullseye

RUN apt update && apt full-upgrade -y &&\
    apt install -y curl\
    git\
    build-essential &&\
    curl -fsSL https://deb.nodesource.com/setup_18.x | bash - &&\
    apt install -y nodejs &&\
    npm install -g yarn webpack &&\
    git clone https://github.com/portainer/portainer.git /opt/portainer &&\
    apt clean
    
COPY ./tools/setup.sh /start.sh

RUN chmod +x /start.sh

CMD ["bash", "/start.sh"]