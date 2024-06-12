NAME := transcendence
PATH_TRANSCENDENCE := $(shell pwd)

${NAME}:
	docker compose -f $(PATH_TRANSCENDENCE)/srcs/docker-compose.yml up --build 

up:
	docker compose -f $(PATH_TRANSCENDENCE)/srcs/docker-compose.yml up -d --build 

down:
	docker compose -f $(PATH_TRANSCENDENCE)/srcs/docker-compose.yml down

stop:
	docker compose -f $(PATH_TRANSCENDENCE)/srcs/docker-compose.yml stop

start:
	docker compose -f $(PATH_TRANSCENDENCE)/srcs/docker-compose.yml start

rm_volume:
	docker volume prune -f
	
rm_network:
	docker network prune -f

rm_container:
	docker container prune -f

rm_image:
	docker image prune -f

rm_system:
	docker system prune -af

clean: down rm_image rm_container rm_network rm_system

fclean: down rm_image rm_container rm_volume rm_network rm_system 

re: fclean ${NAME}
