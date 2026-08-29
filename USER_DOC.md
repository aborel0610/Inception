# USER DOCUMENTATION

## Our Stack

This project allows the creation of a simple, self-hosted website made up of three containerised services, each running on its own Docker container on a private network.
Our three containers are:
	- **NGINX**: a web server. It handles all incoming HTTPS traffic. It is the only service exposed to the outside.
	- **WordPress (with PHP-FPM)**: content management system that powers tha website
	- **MariaDB**: database that stores the WordPress content
To summarise, traffic goes through NGINX, who forwards requests to WordPres, who reads and writes data to MariaDB.

## Start the project

1. Launch the virtual machine Inception on Oracle VirtualBox. This machine runs Debian 12 Bookworm - the penultimate stable version of Debian - in all the default settings.

2. Run ``` make secrets ```. For security reasons, no passwords are shared on git. You must therefore build the secrets folder and enter the passwords you want in the corresponding txt files.

3. Run ``` make ``` and go to https://aborel.42.fr (the website may take a minute to be accessible). 

4. You can run ``` make down ``` to delete the project. If you change configurations and need to reboot completely, you may need to run ``` make clean ```. This will delete the volumes present on the host.

## Accessing the Website and Managing Credentials

Open https://aborel.42.fr.
To access admin panel go to https://aborel.42.fr/wp-admin. From there you can login as an admin or a user.
Usernames are in env, passwords are in secrets. You must run ``` make re ``` after changing one of them.
NEVER PUSH SECRETS TO GIT OR ANYONE WILL BE ABLE TO SIGN IN WITH YOUR PASSWORD.

## Checking that Services are Running Correctly

Use command ``` docker ps ``` to see containers and ``` docker images ``` to see images.
``` docker logs <container_name> ``` will show you the logs for this specific service.

	- To check the website is up and has the correct TLS certificate:
	```
	curl -v https://localhost:443
	curl -v https://aborel.42.fr
	```
	You can also go to https://aborel.42.fr. A "Connection not Secured" page will show up. This is because the certificate is self-signed, meaning the person who delivered it (me) is also the person who signed it (also me) and the Certificate Authority hasn't checked it. This is normal. Click on the padlock >> Connection not secured >> More Information >> View Information to see the TLS details.

To check the volumes, run ``` docker volume ls ```. To see details, run ``` docker volume inspect <container_name> ```.