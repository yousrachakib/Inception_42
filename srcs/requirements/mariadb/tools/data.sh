#!/bin/bash
service mysql start

mysql -e"CREATE DATABASE IF NOT EXISTS $DB_NAME;";

mysql -e"CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PSSWRD';";

mysql -e"GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%';"; # replace *.* by database name

mysql -e"FLUSH PRIVILEGES;";

mysql -e"ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';";

mysql -e"FLUSH PRIVILEGES;";

kill `cat /var/run/mysqld/mysqld.pid` 

exec "$@"