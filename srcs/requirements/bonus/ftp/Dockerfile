FROM debian:bullseye

RUN apt update && apt full-upgrade -y &&\
    apt install -y vsftpd;\
    apt clean

COPY ./tools/setup.sh /setup.sh
COPY ./conf/vsftpd.conf /etc/vsftpd.conf

RUN chmod +x /setup.sh

CMD ["bash", "/setup.sh"]
