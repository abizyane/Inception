
all: build up

build:
	@docker-compose -p inception -f ./srcs/docker-compose.yml build
	@mkdir -p $(HOME)/data/database_volume
	@mkdir -p $(HOME)/data/wordpress_volume

print:
	echo $(HOME)

up:
	@docker-compose -p inception -f ./srcs/docker-compose.yml up

down:
	@docker-compose -p inception -f ./srcs/docker-compose.yml down

state:
	@docker-compose -p inception -f ./srcs/docker-compose.yml ps

pause:
	@docker-compose -p inception -f ./srcs/docker-compose.yml pause

unpause:
	@docker-compose -p inception -f ./srcs/docker-compose.yml unpause

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
	@echo "All containers, images, networks and volumes have been removed."
	@rm -rf $(HOME)/data

re: fclean all
