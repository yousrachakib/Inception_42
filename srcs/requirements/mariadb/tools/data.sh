#!/bin/bash

service mysql start
sleep 1

mysql -e"CREATE DATABASE IF NOT EXISTS $DB_NAME;";

mysql -e"CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PSSWRD';";

mysql -e"GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';";

mysql -e"FLUSH PRIVILEGES;";

mysql -e "UPDATE mysql.user SET authentication_string = PASSWORD('${MYSQL_ROOT_PASSWORD}') WHERE User = 'root' AND Host = 'localhost';"

mysql -e"FLUSH PRIVILEGES;";


kill `cat /var/run/mysqld/mysqld.pid` 

exec "$@"