#!/usr/bin/env bash

set -e

groupadd $FTP_USER

useradd $FTP_USER -d /var/www -g $FTP_USER

echo "$FTP_USER:$FTP_PASSWORD" | chpasswd

chown $FTP_USER:$FTP_USER /var/www

rm -rf /etc/vsftpd/

mkdir /etc/vsftpd

mv /etc/vsftpd.conf /etc/vsftpd/vsftpd.conf

echo "FTP_LOCAL_DIR=$FTP_LOCAL_DIR" >> /etc/vsftpd/vsftpd.conf

mkdir -p /var/run/vsftpd/empty

chown $FTP_USER:$FTP_USER /var/run/vsftpd/empty

chmod a-w /var/www

/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf 