#!/bin/bash

# DB_NAME=Wordpress
# DB_USER=yochakib
# DB_PSSWRD=1234
# MYSQL_ROOT_PASSWORD=1234

# service mysql start
# #this ensures that the database server is running and ready to accept connections.

# mysql -e "CREATE DATABASE IF NOT EXISTS $DB_NAME";

# # This line uses the mysql command-line tool to connect to the MySQL/MariaDB server as t
# mysql -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PSSWRD'";
# # The @'%' part specifies that the user can connect from any host.

# mysql -e "GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%';" ;
# #*.* all databases and tables in the MySQL server.

# mysql -e "FLUSH PRIVILEGES;"

# mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '$MYSQL_ROOT_PASSWORD';"

# mysql -e "FLUSH PRIVILEGES;"

# mysql -u root -p "$MYSQL_ROOT_PASSWORD"

# #mysql -e "SHUTDOWN;"
# kill `cat /var/run/mysqld/mysqld.pid`

# mysqld
# #this line start the server again
#------------------------------------------------------------------------
#!/bin/bash

DB_NAME=wp_data
DB_USER=yochakib
DB_PSSWRD=1234
MYSQL_ROOT_PASSWORD=1234

service mysql start

mysql -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;";

mysql -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PSSWRD';";

mysql -e "GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%';"; # replace *.* by database name

mysql -e "FLUSH PRIVILEGES;";

mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';";

mysql -e "FLUSH PRIVILEGES;";

#mysql -u root -p"$MYSQL_ROOT_PASSWORD"

kill `cat /var/run/mysqld/mysqld.pid`

exec "$@"