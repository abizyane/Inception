all: build up

build:
	@docker-compose -f ./srcs/docker-compose.yml build
# @mkdir -p /home/$(USER)/data/database_volume
# @mkdir -p /home/$(USER)/data/wordpress_volume

up:
	@docker-compose -f ./srcs/docker-compose.yml up

down:
	@docker-compose -f ./srcs/docker-compose.yml down

state:
	@docker-compose -f ./srcs/docker-compose.yml ps

pause:
	@docker-compose -f ./srcs/docker-compose.yml pause

unpause:
	@docker-compose -f ./srcs/docker-compose.yml unpause

start:
	@docker-compose -f ./srcs/docker-compose.yml start

stop:
	@docker-compose -f ./srcs/docker-compose.yml stop

restart:
	@docker-compose -f ./srcs/docker-compose.yml restart

clean: down
	@docker-compose -f ./srcs/docker-compose.yml rm -f -v -s

fclean: clean
	@docker rm -f $$(docker ps -a -q) > /dev/null 2>&1 || true
	@docker rmi -f $$(docker images -a -q) > /dev/null 2>&1 || true
	@docker network rm $$(docker network ls -q) > /dev/null 2>&1 || true
	@docker volume rm $$(docker volume ls -q) > /dev/null 2>&1 || true
	@echo "All containers, images, networks and volumes have been removed."
#@docker system prune -f > /dev/null 2>&1 || true
# @rm -rf /home/$(USER)/data
re: fclean all