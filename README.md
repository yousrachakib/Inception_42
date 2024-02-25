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
    
