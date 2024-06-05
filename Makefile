
all: build up

build:
	@docker-compose -p inception -f ./srcs/docker-compose.yml build
	@mkdir -p /Users/abizyane/data/database_volume
	@mkdir -p /Users/abizyane/data/wordpress_volume

mand:
	@docker-compose -p inception -f ./srcs/docker-compose.yml build mariadb wordpress redis nginx
	@mkdir -p /Users/abizyane/data/database_volume
	@mkdir -p /Users/abizyane/data/wordpress_volume
	@docker-compose -p inception -f ./srcs/docker-compose.yml up mariadb wordpress redis nginx

up:
	@docker-compose -p inception -f ./srcs/docker-compose.yml up

down:
	@docker-compose -p inception -f ./srcs/docker-compose.yml down

state:
	@docker-compose -p inception -f ./srcs/docker-compose.yml ps

start:
	@docker-compose -p inception -f ./srcs/docker-compose.yml start

stop:
	@docker-compose -p inception -f ./srcs/docker-compose.yml stop

restart:
	@docker-compose -p inception -f ./srcs/docker-compose.yml restart

clean: down
	@docker system prune -f > /dev/null 2>&1 || true

fclean: clean
	@docker rm -f $$(docker ps -a -q) > /dev/null 2>&1 || true
	@docker rmi -f $$(docker images -a -q) > /dev/null 2>&1 || true
	@docker network rm $$(docker network ls -q) > /dev/null 2>&1 || true
	@docker volume rm $$(docker volume ls -q) > /dev/null 2>&1 || true
	@docker system prune -af > /dev/null 2>&1 || true
	@echo "All containers, images, networks and volumes have been removed."
	@rm -rf /Users/abizyane/data

re: fclean all
