all: up

up:
	@mkdir -p /home/aborel/data/mariadb
	@mkdir -p /home/aborel/data/wordpress
	@docker-compose -f ./srcs/docker-compose.yml up --build -d

down:
	@docker-compose -f ./srcs/docker-compose.yml down --volumes
re: down up

clean: down
	@docker system prune -af
	sudo rm -rf /home/aborel/data/wordpress/* /home/aborel/data/mariadb/*
	
env:
	@cp .env.template ./srcs/.env
	@echo "\033[0;31mREMEMBER TO SET UP PASSWORDS\033[0m\n"

.PHONY: all up down re clean fclean env

