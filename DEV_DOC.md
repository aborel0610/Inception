# DEVELOPER DOCUMENTATION

## Environment Setup
### Prerequisites

Docker Engine and Docker Compose need to be installed.

### Configuration Files
- "docker-compose.yml" defines the three services, the bridge network, and the named volumes.
- Every service has its own Dockerfile. If needed, a configuration file is in conf/. Entrypoint scripts are in tools/

### Secrets

Secret file are generated via ``` make secrets ```. They needed to be filled out before launching the project.
DO NOT COMMIT SECRETS TO GIT.

## Building and Launching

- As previously mentioned, run ``` make secrets ``` and set up your passwords.
- Then you can ``` make ``` or ``` make up ``` to aunch the Docker Compose.
- ``` make down ``` stops and removes the containers, but the volumes are intact.
- ``` make re ``` performs ``` make down ``` then ``` make up ```
- ``` make clean ``` removes removes containers, images, volumes, network

## Managing Containers and Volumes

- ``` docker ps ```: list running containers
- ``` docker logs -f <name> ```: follow logs for a service
- ``` docker volume ls ```: list volumes
As required by the subject, this project uses named volumes stored in /home/aborel/data.
WordPress and MariaDB both have their own volumes, where the data they use is stored. Because both are host-path-backed volumes rather than container-internal storage, data survives container removal and rebuilds and is only lost on make clean.