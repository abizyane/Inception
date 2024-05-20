#!/usr/bin/env bash
mysql -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"
mysql -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -e "FLUSH PRIVILEGES;"
mysqladmin -p$MYSQL_ROOT_PASSWORD shutdown

# mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown
# mysql -e "SHOW DATABASES;"

mysqld_safe &