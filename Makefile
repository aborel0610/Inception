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
	
secrets:
	@mkdir -p ./srcs/secrets
	@touch ./srcs/secrets/sql_password.txt \
		./srcs/secrets/sql_root_password.txt \
		./srcs/secrets/wp_admin_pass.txt \
		./srcs/secrets/wp_user_pass.txt

.PHONY: all up down re clean secrets

