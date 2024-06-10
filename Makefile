DC_CMD = @docker-compose -p inception -f ./srcs/docker-compose.yml
DATA_PATH = /Users/abizyane/data

all: build up

build:
	$(DC_CMD) build
	@mkdir -p $(DATA_PATH)/database_volume
	@mkdir -p $(DATA_PATH)/wordpress_volume

mand:
	$(DC_CMD) build mariadb wordpress redis nginx
	@mkdir -p $(DATA_PATH)/database_volume
	@mkdir -p $(DATA_PATH)/wordpress_volume
	$(DC_CMD) up mariadb wordpress redis nginx

up:
	$(DC_CMD) up 

down: 
	$(DC_CMD) down

state:
	$(DC_CMD) ps

start:
	$(DC_CMD) start

stop:
	$(DC_CMD) stop

restart:
	$(DC_CMD) restart

logs:
	$(DC_CMD) logs

clean: down
	@docker system prune -f > /dev/null 2>&1

fclean: clean
	@docker rm -f $$(docker ps -a -q) > /dev/null 2>&1
	@docker rmi -f $$(docker images -a -q) > /dev/null 2>&1
	@docker network rm $$(docker network ls -q) > /dev/null 2>&1
	@docker volume rm $$(docker volume ls -q) > /dev/null 2>&1
	@docker system prune -af > /dev/null 2>&1
	@echo "All containers, images, networks and volumes have been removed."
	@rm -rf $(DATA_PATH)

re: fclean all