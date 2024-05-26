FROM debian:bullseye

RUN apt update &&\
    apt full-upgrade -y &&\
    apt install -y vsftpd;\
    apt clean

COPY ./conf/vsftpd.conf /etc/vsftpd.conf

CMD ["vsftpd", "/etc/vsftpd.conf"]