#!/usr/bin/env bash

set -e

groupadd $FTP_USER

useradd $FTP_USER -d /var/www -g $FTP_USER

echo "$FTP_USER:$FTP_PASSWORD" | chpasswd

chown $FTP_USER:$FTP_USER /var/www

mkdir -p /etc/vsftpd

touch /etc/vsftpd/vsftpd.conf

echo "listen=YES\n" > /etc/vsftpd/vsftpd.conf

echo "local_root=$FTP_LOCAL_DIR\n" >> /etc/vsftpd/vsftpd.conf

echo "write_enable=YES\n" >> /etc/vsftpd/vsftpd.conf

echo "local_enable=YES\n" >> /etc/vsftpd/vsftpd.conf

echo "chroot_local_user=YES\n" >> /etc/vsftpd/vsftpd.conf

echo "anonymous_enable=YES\n" >> /etc/vsftpd/vsftpd.conf

echo "foreground=YES\n" >> /etc/vsftpd/vsftpd.conf

echo "pasv_enable=YES\n" >> /etc/vsftpd/vsftpd.conf

echo "pasv_min_port=21000\n" >> /etc/vsftpd/vsftpd.conf

echo "pasv_max_port=21010\n" >> /etc/vsftpd/vsftpd.conf

mkdir -p /var/run/vsftpd/empty

chown $FTP_USER:$FTP_USER /var/run/vsftpd/empty

/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf
