*This project has been created as part of the 42 curriculum by aborel*

# Description
The goal of this project is to set up a small infrastructure composed of different services under specific rules using Docker. It creates a WordPress website at https://aborel.42.fr.

# Instructions
1. Launch the virtual machine Inception on Oracle VirtualBox. This machine runs Debian 12 Bookworm - the penultimate stable version of Debian - in all the default settings.

2. Run ``` make env ```. For security reasons, no passwords are shared on git. You must therefore build the environment yourself and enter the required passwords at the bottom of the env.

3. Run ``` make ``` and go to https://aborel.42.fr (the website may take a minute to be accessible). 

4. You can run ``` make down ``` to delete the project. If you change configurations and need to reboot completely, you may need to run ``` make clean ```. This will delete the volumes present on the host.

# Resources

RTFM: https://docs.docker.com/get-started/
Tutoriel Docker (in French): https://blog.stephane-robert.info/docs/conteneurs/moteurs-conteneurs/docker/
Docker Tutorials for Beginners: https://www.youtube.com/watch?v=3c-iBn73dDE


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