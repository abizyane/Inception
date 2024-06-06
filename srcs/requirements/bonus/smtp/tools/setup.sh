!/bin/bash
mkdir -p ${SMTP_DATA}

postconf -e 'smtpd_banner = $HOST_NAME ESMTP $MAIL_NAME (Debian/GNU)'
postconf -e 'biff = no'
postconf -e 'append_dot_mydomain = no'
postconf -e 'readme_directory = no'
postconf -e 'smtpd_tls_cert_file=/etc/ssl/certs/ssl-cert-snakeoil.pem'
postconf -e 'smtpd_tls_key_file=/etc/ssl/private/ssl-cert-snakeoil.key'
postconf -e 'smtpd_use_tls=yes'
postconf -e 'smtpd_tls_session_cache_database = btree:${SMTP_DATA}/smtpd_scache'
postconf -e 'smtp_tls_session_cache_database = btree:${SMTP_DATA}/smtp_scache'

exec /usr/sbin/postfix start-fg

# docker exec -it smtp bash -c "swaks --to test@example.com --from sender@example.com --server localhost:25"