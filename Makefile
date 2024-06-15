DC_CMD = @docker-compose -p inception -f ./srcs/docker-compose.yml
DATA_PATH = /home/$(USER)/data

all: build up

build:
	$(DC_CMD) build
	@mkdir -p $(DATA_PATH)/database_volume
	@mkdir -p $(DATA_PATH)/wordpress_volume

up:
	$(DC_CMD) up

down: 
	$(DC_CMD) down -t 2

state:
	$(DC_CMD) ps

restart:
	$(DC_CMD) restart

logs:
	$(DC_CMD) logs

clean: down
	@docker system prune -af > /dev/null 2>&1

fclean: clean
	@docker system prune -f --volumes > /dev/null 2>&1
	@docker builder prune -af > /dev/null 2>&1
	@rm -rf $(DATA_PATH)
	@echo "All containers, images, networks and volumes have been removed."

re: fclean all