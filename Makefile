all: up

up:
	@mkdir -p /home/aborel/data/mariadb
	@mkdir -p /home/aborel/data/wordpress
	@docker-compose -f ./srcs/docker-compose.yml up --build 

down:
	@docker-compose -f ./srcs/docker-compose.yml down --volumes 
	@sudo rm -rf /home/aborel/data/mariadb
	@sudo rm -rf /home/aborel/data/wordpress

re: down up

clean: down
	@docker-compose -f ./srcs/docker-compose.yml down --volumes 
	@sudo rm -rf /home/aborel/data/mariadb
	@sudo rm -rf /home/aborel/data/wordpress

fclean : clean
	@docker system prune -af

env:
	@cp .env.template ./srcs/.env
	@echo "\033[0;31mREMEMBER TO SET UP PASSWORDS\033[0m\n"

.PHONY: all up down re clean fclean env

