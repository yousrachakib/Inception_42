# Inception
This project aims to broaden our knowledge of system administration by using Docker. we will virtualize several Docker images, creating them in our new personal virtual machine.

# What is Docker :

  * Docker is a container management service .
   ![docker-contain (1)](https://github.com/yousrachakib/Inception/assets/110408013/05b0d3c2-735a-40b0-b672-21b44de05ebe)`
 
  * Infrastructure : it’s our computer components like our CPU and Hard Disk and          other physical components.
  * Host Operating System : Its the OS that our computer is working on like linux or      mac os or even windows
  * Docker engine : this is where the magic happens docker engine is the base engine      installed in the host machine to build and run containers using docker components     and services, it uses
  * App : is the container that is running in isolation on the other containers

## What is a Container ?

 * A container is a standard unit of software that packages up code and all its dependencies so the application runs quickly and reliably from one computing enviroment to another .
 * Containerization been around for a long time, but it was introduced in a diffrent way by Docker.
 * It packages applications as images that contain everything needed to run them : code, runtime environement , libraries, and configuration.
 * A Docker container image id a lightweight, standalone, executable package of software that includes everything needed to run an application : code, runtime, system tools, system libraries and settings.

## Virtualization :

 * Virtualization is thechnology that lets you create useful IT services          using resources that are traditionally bound to hardware. it allows to      use a physical machines full capacity by distributing its capabilities        among many users or environments.
 
# HOW DOES DOCKER ENGINE WORKS IN DETAILS ?

 ## Docker Architecture :
  ### Image :
    * An image is a read-only template with instructions for creating a Docker container, you may build, an image which is based on the Ubuntu image or SQL Server.
 ### Container :
    * A container is a runnable instance of an image. You can create, start, stop, move, or delete a container using the Docker API or CLI.
 ### Registry :
    * A Docker registry stores Docker images. Docker Hub is a public registry that anyone can use, and Docker is configured to look for images on Docker Hub by default. You can even run your own private registry.
 ### Client :
    * The Docker client is the primary way that many Docker users interact with Docker. When you use commands such as docker run, the client sends these commands to dockerd, which carries them out. The docker uses the Docker API to execute commands .

### Namespaces :
 * Docker uses a technology called namespaces to provide the isolated workspace called the container. When you run a container, Docker creates a set of namespaces for that container. These namespaces provide a layer of isolation. Each aspect of a container runs in a seperate namespace and its access is limited to that namespace.

# DOCKER CLI (Command line interface) : 
 * Here Ill try to explain some useful command to manipulate and debug Container, and to pull images as well .
     ## Docker pull :
        * this command is used to download a Docker image from a registry and store it locally on your machine.
     ## Docker run :
        * command is used to create and start a new Docker container.
    * the RUN commanbd have some options "-d" for detached mode, "--name" to rename a container and "-p" for port binding .
       - The "-d" option runs the container in the background or detach mode, allowing you to continue using your terminal without being attached to the container's output.
       - The "--name" option allows you to specify a custom name for the container, making it easier to identify and reference.
       - The "-p" option is used for port mapping, enabling communication between the host system and the container. It allows you to bind a port on the host to a port              inside the container, facilitating access to the containerized application from the external world.
    Including these options in the "docker run" command allows you to run a container in the background with a custom name and establish port mappings for communication         with other services or applications.
    ## Docker ps -a (all):
       * thsi command is used to list the currently running Docker containers on your system.
   * It provides an overview of the containers' essential information, such as their container ID, image used, status (running, stopped, etc.), and the ports they are           listening on. It allows you to quickly view the active containers and gather information about them, which can be helpful for troubleshooting, monitoring, or managing      your Docker environment.
  
   ## Docker images :
       * which gives you all the images that you have localy .

   ## Docker logs :
       * The "docker logs" command is used to view the logs generated by a running Docker container. It allows you to retrieve and display the log output produced by the c          container's processes, which can be useful for troubleshooting, monitoring, and debugging purposes.
   ## Docker exec -it (interactive tty):
       * The "docker exec -it" command is an extension of the "docker exec" command that provides an interactive session within a running Docker container. It allows you            to enter an interactive mode and interact with the container's command-line environment.
     *  When using "docker exec -it" followed by the container's name or ID and a command, it opens an interactive session connected to the container's terminal.

# What is Docker file :

 A Dockerfile is a text file that contains a set of instructions used to build a Docker image. It serves as a blueprint or recipe for creating a standardized and reproducible container image.

In simpler terms, think of a Dockerfile as a set of step-by-step instructions that tell Docker how to assemble the necessary components and configurations required to create a containerized application. These instructions can include actions like copying files into the image, installing dependencies, setting environment variables, and specifying the commands to run when the container starts.

By using a Dockerfile, you can automate the process of building a Docker image, ensuring consistency and predictability across different environments. It allows you to define the exact state and behavior of the container, making it easier to share and deploy applications in a portable manner.

Once you have a Dockerfile, you can use the "docker build" command to build an image based on the instructions provided in the file. The resulting image can then be used to create and run containers, allowing you to package and deploy your applications with all their dependencies and configurations encapsulated within a single, self-contained unit.

# First we need to create 3 containers :
    * NGINX (with TLS v1.2)
    * WordPress (with php-fpm)
    * MARIADB (without NGNIX)

 ## Mariadb :
  * MariaDB is an open-source relational database management system (RDBMS) and a fork of MySQL. It was created by the original developers of MySQL as an alternative to        MySQL after its acquisition by Oracle Corporation.
    Key Features:

    * Compatibility: MariaDB is designed to be highly compatible with MySQL, allowing most MySQL applications to work seamlessly with MariaDB.
    * Performance: MariaDB incorporates performance optimizations, providing improved query execution, storage engines, and concurrency handling.
    * Storage Engines: MariaDB supports multiple storage engines, including InnoDB, Aria, and MyRocks, offering flexibility in data storage.
    * Security: MariaDB offers various security features, such as user authentication, access control, data encryption, and SSL/TLS for secure connections.
    * Replication and Clustering: MariaDB supports different replication methods and clustering solutions for high availability and scalability.
    * Tools and Utilities: MariaDB provides a range of tools and utilities for managing and monitoring databases, including command-line clients and graphical interfaces.
    * Active Community: MariaDB has a vibrant open-source community that contributes to its development, ensuring regular updates and bug fixes.
    * Licensing: MariaDB is released under the GNU General Public License (GPL), allowing users to use, modify, and distribute the software without licensing costs.

 ### Instalation part :
    1.Pull debian:buster (our base image)
    2.update our package manager apt update
    3.install mariadb server apt install mariadb-server -y
    4.use the sed command to modify the "50-server.cnf" configuration file for MariaDB located in "/etc/mysql/mariadb.conf.d/" to allow connections to the MariaDB server       from outside the container
    5.service mysql start
    6.create our database and our user and give him the access to the database then FLUSH PRIVILEGES
 ***my script :***
 ```bash
  #!/bin/bash
 
 service mysql start 
 #this ensures that the database server is running and ready to accept connections.
 
 mysql -u root -p -e "CREATE DATABASE IF NOT EXISTS $DB_NAME";
 # This line uses the mysql command-line tool to connect to the MySQL/MariaDB server as the root user (-u root) and prompts for the root user's password (-p).
 # It then executes an SQL statement to create a database with the name specified in the $DB_NAME variable.
 # The IF NOT EXISTS clause ensures that the database is created only if it doesn't already exist.
 
 mysql -u root -p -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PSSWRD'";
 # This line creates a user with the name specified in the $DB_USER variable and sets the user's password to the value in the $DB_PSSWRD variable. 
 # The IF NOT EXISTS clause ensures that the user is created only if it doesn't already exist. The @'%' part specifies that the user can connect from any host.
 
 mysql -u root -p -e "GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%';" ;
 # This line grants all privileges to the user specified in the $DB_USER variable. 
 # The *.* syntax indicates that the user has full privileges on all databases and tables. The @'%' part specifies that the user can connect from any host.
 
 mysql -u root -p -e "FLUSH PRIVILEGES;"
 # This line flushes the privileges to ensure that the changes made in the previous GRANT statement take effect immediately.
 
 mysql -u root -p -e "alter user 'root'@'localhost' identified by '$MYSQL_ROOT_PASSWORD';" ;
 #This line changes the password for the root user of the MySQL/MariaDB server. The new password is specified in the $MYSQL_ROOT_PASSWORD variable.
 
 kill `cat /var/run/mysqld/mysqld.pid`
 #This line kills the MySQL/MariaDB server process by sending a signal to the process ID (PID) specified in the /var/run/mysqld/mysqld.pid file. 
 #Killing the process will stop the MySQL/MariaDB server.
 
 mysqld
 #this line start the server again


