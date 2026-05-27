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
	
	