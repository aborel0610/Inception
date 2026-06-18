# <font color="red">Docker for Beginners </font>

## What is Docker

- Virtualisation software that makes developing and deploying application much easier
- Packages app w/ all necessary dependencies, configuration, system tools and runtime into a **container** --> easy to share and distribute
- No longer need to install and configure all services directly on local machine. Depending on OS -> installation process dif => many things can go wrong
- Container = own isolated env. Start service with docker command that is same on all OS
- Docker virtualises the OS applications layer, while VM virtualises OS applications layer and  OS kernel (kernel communicates with hardware). Docker much faster and smaller, however only compatible with Linux (except with Linux Desktop)

## Docker Images

- Executable app artifact. Includes app source code, and also complete env config
- Container = running instance of image. Can run multiple containers from 1 image
- Docker registries: ready-made docker images (Redis, MongoDB, Postgres, or Docker communities): Docker Hub (not allowed in this project)

## Docker Commands

- *pull*: download image (DockerHub = default position searched)
- *images*: show all downloaded images
- *run*: launch image
- *ps*:show which containers are running
- docker stop $(docker ps -qa); docker rm $(docker ps -qa); docker rmi -f $(docker images -qa); docker volume rm $(docker volume ls -q); docker network rm $(docker network ls -q) 2>/dev/null

## Port Binding

- Container runs on a port. Need to bind port to localhost so you can access it
- **docker run -d -p *local_port*:*container_port* *image***

## Docker Compose
- Helps define and share multi-container apps

# <font color="red">Installed programs</font>

- **APT** (Advanced Package Tool): installation and removal of software on Debian
- **Nginx**: web server
- **TLS** (Transport Layer Security): server authentification, confidentiality (data encryption), integrity
	- https://ln5.sync.com/dl/83b734df0/view/pdf/8100210430014?sync_id=0#6pwcftu2-zvqpn8me-ba9evy2v-35xvawt8
	- https://www.digitalocean.com/community/tutorials/openssl-essentials-working-with-ssl-certificates-private-keys-and-csrs#introduction
	- Private key: signs proofs during TLS handshakes.
		- RSA vs DSA keys: two different algorithms.
			- RSA = fast signature verification but slower signature creation
			- DSA = slower signature verification but fast signature creation
			- both secure, RSA has been around longer and is more popular
	- CSR (Certificate Signing Request): request that bundles public key with a Distinguished Name (DN) and optional extensions. Asks for SSL/TLS certificate from Certificate Authority (CA)
		- Subj: answers prompt for DN
		- stored in .crt file on Linux and .cer file on Windows
	- Public key to encrypt and private key to decrypt
- **FastCGI** (Common Gateway Interface): protocol that defines how the web server communicates with CGI program (PHP).
- **MariaDB**: relational database management system

## Docker Volumes

- Used to make data persistent
- Container runs on host. If container is deleted then restarted --> no persistence
- 3 types of volumes
	- Host volumes: you decide where on the host file system you mount into the container
	- Anonymous volumes: don't specify which directory on the host should be mounted, automatically decided by docker
	- Named volumes: anonymous volumes but you specify the name of the folder on the host file system
- Bind mounts: binds a directory from container to directory from host
	- volumes are easier to back up or migrate, are more safely shared between containers, don't have to be on host, can be anywhere (external storage), high performance I/O
	- dependent on dir structure and OS of host machine, while volumes are completely managed by Docker
	- better than volumes if you need to access files or directories from both containers and the host

## Docker Secrets

- Used to manage sensitive data. Encrypted during transit, stroed in Docker swarm. Only accessible to services which have been granted explit access to it, and only while those services are running
- Swarm = cluster of Docker Engines

## Docker Compose
- Allows easy setup of containers. Someone on another machine only needs to do "docker compose up" and all containers are created exactly the way they were created on yours
- https://blog.stephane-robert.info/docs/conteneurs/orchestrateurs/docker-compose/
- https://docs.docker.com/reference/compose-file/services/