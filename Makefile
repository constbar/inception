all:
	sudo mkdir -p /home/agroup/data/wordpress
	sudo mkdir -p /home/agroup/data/mysql
	cd ./srcs/requirements/wordpress/conf && bash set_env.sh
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
	-docker rm `docker ps -qa`
	-docker rmi -f `docker images -qa`
	-docker volume rm `docker volume ls -q`
	-docker network rm `docker network ls -q`
	sudo rm -rf /home/agroup/data