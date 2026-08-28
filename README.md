*This project has been created as part of the 42 curriculum by aborel*

# Description
The goal of this project is to set up a small infrastructure composed of different services under specific rules using Docker. It creates a WordPress website at https://aborel.42.fr.

Docker is a virtualisation software that makes developing and deploying application much easier. It packages app w/ all necessary dependencies, configuration, system tools and runtime into a **container**, making it easy to share and distribute.
Thanks to Docker, you no longer need to install and configure all services directly on local machine. Depending on the OS the installation process for an app can be different and many things can go wrong.
Software is packaged in containers. A container is a runtime environment with all the necessary component (code, dependencies, libraries) needed to run the application code without using the host machine dependencies. These containers can be run on any machine or virtual machine where Docker is installed.
A Docker **image** is a standalone, executable file used to create a container. It contains all the libraries, dependencies, and files that the container needs to run. Multiple containers can be made from one image. Ready made images called Docker registries are available on DockerHub (these were not used here as that would defeat the point of this project).

# Instructions
1. Launch the virtual machine Inception on Oracle VirtualBox. This machine runs Debian 12 Bookworm - the penultimate stable version of Debian - in all the default settings.

2. Run ``` make secrets ```. For security reasons, no passwords are shared on git. You must therefore build the secrets folder and enter the passwords you want in the corresponding txt files.

3. Run ``` make ``` and go to https://aborel.42.fr (the website may take a minute to be accessible). 

4. You can run ``` make down ``` to delete the project. If you change configurations and need to reboot completely, you may need to run ``` make clean ```. This will delete the volumes present on the host.

# Resources

RTFM: https://docs.docker.com/get-started/
Tutoriel Docker (in French): https://blog.stephane-robert.info/docs/conteneurs/moteurs-conteneurs/docker/
Docker Tutorials for Beginners: https://www.youtube.com/watch?v=3c-iBn73dDE
Difference between Docker Images and Containers: https://aws.amazon.com/compare/the-difference-between-docker-images-and-containers/


OpenSSL Essentials: https://www.digitalocean.com/community/tutorials/openssl-essentials-working-with-ssl-certificates-private-keys-and-csrs#introduction
TLS Cheat Sheet: https://ln5.sync.com/dl/83b734df0/view/pdf/8100210430014?sync_id=0#6pwcftu2-zvqpn8me-ba9evy2v-35xvawt8

AI use: AI was used as a debugging tool and to make sure the project followed best practices of privacy and cybersecurity.

# Project Description

## Virtual Machines vs Docker

An OS has 2 layers: kernel (communicates with hardware) and application. A virtual machine virtualises both the kernel and the applications layer, whereas docker only virtualises the applications layer.
A Docker image contains the applications layer of a service.
Docker is therefore much faster and smaller.

## Secrets vs Environment Variables

Docker Secrets are used to manage sensitive data. The data in them is encrypted during transit. It is therefore only accessible to services which have been granted explicit access to them.
Environment variables however, are accessible to everyone with access to the environment. This makes sharing sensitive data such as passwords unsafe.

## Docker Network vs Host Network

The bridge network is the default network of Docker. It is a virtual private network that allows containers connected to the same bridge network to communicate, while providing isolation from containers. Each container gets its own IP address on the virtual network. The bridge network also provides automatic DNS resolution, as other containers can access each other using servicename:port (ex: mariadb:3306). Port publishing is required.

When using the host network mode, the container's network stack isn't isolated from the Docker host. The container doesn't get its own IP address allocated, it is available via localhost:port_number, with no port publishing possible.

## Docker Volumes vs Bind Mounts

Volumes and bind mounts are used for data persistence. That way, you can turn off your machine and your data will not be deleted.
Bind mounts are dependent on the directory structure and OS of the host machine, while volumes are managed by Docker.
Volume pros:
	- easier to back up, migrate, share between containers
	- can be managed using Docker CLI commands or Docker API
	- work on both Linux and Windows containers
	- high performance I/O
Bind Mount pros:
	- can access files from the host (volumes completely managed by Docker)
Volumes can be named or anonymous. Anonymous volumes are given a random name
