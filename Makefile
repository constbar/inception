all:
	sudo mkdir -p /home/constbar/data/wordpress
	sudo mkdir -p /home/constbar/data/mysql
	cd ./srcs/requirements/wordpress/conf && bash set_env.sh
	cp ./srcs/.env ./
	docker-compose -f ./srcs/docker-compose.yml build
	docker-compose -f ./srcs/docker-compose.yml up -d

build:
	docker-compose -f ./srcs/docker-compose.yml build

down:
	docker-compose -f ./srcs/docker-compose.yml down
	docker-compose -f ./srcs/docker-compose.yml ps

ps:
	docker-compose -f ./srcs/docker-compose.yml ps

fclean:
	docker-compose -f ./srcs/docker-compose.yml down
	-docker stop `docker ps -qa`
	-docker rm `docker ps -qa`
	-docker rmi -f `docker images -qa`
	-docker volume rm `docker volume ls -q`
	-docker network rm `docker network ls -q`
	sudo rm -rf /home/constbar/data