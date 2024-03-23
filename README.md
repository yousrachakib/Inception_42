
# Inception - System Administration Exercise

## Description
This project is a system administration exercise aimed at broadening your knowledge of system administration using Docker. It involves creating a small infrastructure composed of different services and configuring them within a virtual machine.

# Table of Contents:
  - Docker Overview.
  - What is a Dockerfile.
  - What is a Docker compose.
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

 --> https://www.tldraw.com/r/UTQImIBg9XFg1lxE7Ladg?v=-1807,1146,3336,1845&p=page .

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

  # Its Important to knwo the diffrence between CMD and ENTRYPOINT (this link may be helpful) :
  
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

