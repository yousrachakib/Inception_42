
# Inception - System Administration Exercise

## Description
This project is a system administration exercise aimed at broadening your knowledge of system administration using Docker. It involves creating a small infrastructure composed of different services and configuring them within a virtual machine.

# Table of Contents:
  - Docker Overview.
  - What is a Dockerfile.
  - What is Docker compose.
  - Mariadb.
  - Wordpress.
  - Nginx.

# Contributing
Contributions to this project are welcome. If you encounter any issues or have suggestions for improvements, please submit a pull request or open an issue.

# Acknowledgments
This project is based on an exercise in system administration.
Special thanks to the team at 42 for providing the guidelines and requirements.

# Docker overview :
Docker is a platform that allows developers to package their applications and all of their dependencies into lightweight containers. These containers can then be easily shared and run consistently across different environments, from development to production. Think of it like a shipping container for software – it encapsulates everything your application needs to run, such as code, libraries, and system tools. Docker simplifies the process of building, shipping, and running applications, making it easier to deploy software reliably and efficiently, regardless of the underlying infrastructure.

 --> https://www.tldraw.com/v/ImIQTUgdaL2Exl6gFX4gB?v=-1807,1146,3336,1845&p=page .

# What is Dockerfile : (we will be using it to build our own images)
A Dockerfile is a text file that contains a set of instructions used to build a Docker image.When you build an image using a Dockerfile, Docker reads the instructions and executes them in order, creating layers that form the final image.
 ## Base Image:
  - The Dockerfile starts with a base image, which serves as the starting point for your image. It can be a minimal operating system like Alpine Linux or a more feature-       rich distribution like Debian or Ubuntu. The base image provides the foundation on which your application will run.
 ## Instructions: 
  Dockerfile instructions are used to define the steps required to build the image. Each instruction is a command followed by arguments, and it contributes to creating a     new layer in the image. Some commonly used instructions include:
  
  - FROM: Specifies the base image.
  - RUN: Executes commands inside the container during the build process.
  - COPY or ADD: Copies files and directories from the host machine to the image.
  - WORKDIR: Sets the working directory for subsequent instructions.
  - ENV: Sets environment variables inside the container.
  - EXPOSE: Declares the ports on which the container will listen.
  - CMD or ENTRYPOINT: Defines the command to run when the container starts.

  ### *Its Important to knwo the diffrence between CMD and ENTRYPOINT (this link may be helpful)*:
  
  -->> https://spacelift.io/blog/docker-entrypoint-vs-cmd .

 LAYERED FILESYSTEM :
 Docker images use a layered filesystem, where each instruction in the Dockerfile creates a new layer. Layers are read-only and share common parts, which allows for         efficient storage and faster image builds. When you make changes to a running container, those changes are saved in a new writable layer called the container layer.

 CACHING :
 Docker utilizes caching to speed up the image build process. When building an image, Docker checks if each instruction has been executed before and if the context (files   and directories) has changed. If there are no changes, Docker reuses the cached results, skipping the execution of instructions. This can significantly reduce the build    time for subsequent builds.

 ## Best Practice :
  - Use minimal and specific base images to reduce the image size.
  - Combine multiple RUN instructions into a single instruction to reduce the number of layers.
  - Avoid installing unnecessary packages or dependencies.
  - Clean up any temporary files or artifacts created during the build process.
  - Use .dockerignore file to exclude unnecessary files and directories from the build context.

# What is Docker compose ? 
From docker documents : Docker Compose is a tool for defining and running multi-container applications. It is the key to unlocking a streamlined and efficient development and deployment experience.

Compose simplifies the control of your entire application stack, making it easy to manage services, networks, and volumes in a single, comprehensible YAML configuration file. Then, with a single command, you create and start all the services from your configuration file.

### *Learn more on how it works and it benifits* -->> https://docs.docker.com/compose/ .

we will onlt cover CLI (Command Line Interface) and how to write a .yml file :

 - ***docker-compose up***: This command starts all the services defined in your Docker Compose file. It creates and starts the containers, networks, and volumes as necessary. By default, it displays the logs of the running services in the console.
 - ***docker-composedown***: This command stops and removes all the containers, networks, and volumes created by docker-compose up. It cleans up the resources associated with the Docker Compose project.
 - ***docker-compose build***: This command builds the services defined in your Docker Compose file. It rebuilds the Docker images if the Dockerfiles or build contexts have changed.
 - ***docker-compose start***: This command starts the containers for the services defined in your Docker Compose file. Unlike docker-compose up, it does not create new       containers or networks if they don't exist.
 - ***docker-compose stop***: This command stops the running containers for the services defined in your Docker Compose file without removing them. It preserves their state, allowing you to start them again later.
 - ***docker-compose restart***: This command restarts the containers for the services defined in your Docker Compose file. It stops and starts the containers in the correct order.
 - ***docker-compose exec***: This command allows you to execute a command inside a running container. For example, docker-compose exec <service_name> <command> runs the      specified command in the container associated with the given service.
 - ***docker-compose ps***: This command shows the status of the containers defined in your Docker Compose file. It displays information such as the container ID, service name, and status.
 - **docker-compose logs**: This command displays the logs of the running services defined in your Docker Compose file. You can specify the service name to view logs for a    specific service.
### *When it comes to writing a Docker Compose YAML file (docker-compose.yml)* :

**Example**

```
version: '3'
services:
  web:
    image: nginx:latest
    ports:
      - 8080:80
    volumes:
      - ./html:/usr/share/nginx/html
  db:
    image: mysql:latest
    environment:
      - MYSQL_ROOT_PASSWORD=secret
```
*Here are some key concepts in the Docker Compose YAML file:*

- ***version:*** Specifies the version of the Docker Compose file format.
- ***services:*** Defines the services in your application.
- ***image:*** Specifies the image to use for the service.
- ***ports:*** Maps ports between the host and the container.
- ***volumes:*** Mounts host directories or named volumes to the container.
- ***environment:*** Sets environment variables for the container.

You can customize and extend the Docker Compose YAML file based on your application's requirements, adding more services, networks, volumes, environment variables, and other options.
Once you have created the Docker Compose YAML file, you can use the aforementioned Docker Compose CLI commands to manage and interact with your Docker Compose project effectively.
  ##***Docker Networking Concepts*** :
- **Networks**: Docker allows you to create and manage networks that act as virtual switches connecting containers. Networks can be user-defined or pre-defined (e.g.,       bridge, host, overlay networks).
- **Containers**: Docker containers can be connected to one or more networks, enabling communication between containers within the same network.
    
- **IP Addressing**: Containers within a network are assigned IP addresses automatically. Docker uses a built-in DNS server for name resolution, allowing containers         to refer to each other by their container names.
  
- **Port Mapping**: Docker allows you to map container ports to host ports, enabling external access to containerized services.
  
- **Container-to-Container Communication:** Containers on the same network can communicate with each other directly using IP addresses or container names. Docker            provides DNS resolution for container names within the same network.
  
- **Container-to-External Network Communication**: Containers can access external networks, including the internet, by using the host's network stack or by routing          traffic through network gateways.
    
**discover more**--> https://www.tldraw.com/v/qfGwbOg8Y0OmGLCeHuibx?v=-230,136,1966,1087&p=DufyFg2FW2uXx3ULtUAfr .
    
## **This project utilizes a combination of MariaDB, WordPress, and Nginx to create a robust and scalable web application environment.**

# Mariadb :

MariaDB is an open-source relational database management system (RDBMS) that acts as the backend database for the web application. It is a drop-in replacement for MySQL and offers high performance, scalability, and compatibility with MySQL tools and applications. MariaDB provides a reliable and efficient way to store and manage structured data, ensuring data integrity and security.

# Wordpress :

WordPress is a popular content management system (CMS) that simplifies the process of creating and managing websites. It provides a user-friendly interface and a wide range of themes and plugins, making it highly customizable and versatile. WordPress relies on the MariaDB database to store website content, configuration settings, and user data. With WordPress, you can easily create and publish content, manage user accounts, and extend the functionality of your website.

# NGINX :
ginx is a high-performance web server and reverse proxy server. NGINX container plays a crucial role in the project by acting as a reverse proxy and handling incoming requests from clients. The NGINX container handles SSL/TLS termination, decrypting the incoming encrypted requests and forwarding them to the backend services in plain HTTP. This offloads the SSL/TLS decryption process from the backend services, improving their performance.
