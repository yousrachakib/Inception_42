#!/bin/bash

DB_NAME=yodata
DB_USER=yochakib
DB_PSSWRD=123

service mysql start 
#this ensures that the database server is running and ready to accept connections.

mysql -e "CREATE DATABASE IF NOT EXISTS '$DB_NAME'";
# This line uses the mysql command-line tool to connect to the MySQL/MariaDB server as the root user (-u root) and prompts for the root user's password (-p).
# It then executes an SQL statement to create a database with the name specified in the $DB_NAME variable.
# The IF NOT EXISTS clause ensures that the database is created only if it doesn't already exist.

mysql -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PSSWRD'";
# This line creates a user with the name specified in the $DB_USER variable and sets the user's password to the value in the $DB_PSSWRD variable. 
# The IF NOT EXISTS clause ensures that the user is created only if it doesn't already exist. The @'%' part specifies that the user can connect from any host.

mysql -e "GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%';" ;
# This line grants all privileges to the user specified in the $DB_USER variable. 
# The *.* syntax indicates that the user has full privileges on all databases and tables. The @'%' part specifies that the user can connect from any host.

mysql -e "FLUSH PRIVILEGES;"
# This line flushes the privileges to ensure that the changes made in the previous GRANT statement take effect immediately.

#mysql -e "alter user 'root'@'localhost' identified by '$MYSQL_ROOT_PASSWORD';" ;
#This line changes the password for the root user of the MySQL/MariaDB server. The new password is specified in the $MYSQL_ROOT_PASSWORD variable.

mysql -e "FLUSH PRIVILEGES;"
# This line flushes the privileges to ensure that the changes made in the previous GRANT statement take effect immediately.

#kill `cat /var/run/mysqld/mysqld.pid`
#This line kills the MySQL/MariaDB server process by sending a signal to the process ID (PID) specified in the /var/run/mysqld/mysqld.pid file. 
#Killing the process will stop the MySQL/MariaDB server.

mysqld
#this line start the server again
