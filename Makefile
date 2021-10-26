all:
	docker-compose -f ./srcs/docker-compose.yml build
	docker-compose -f ./srcs/docker-compose.yml up -d

up:
	docker-compose -f ./srcs/docker-compose.yml up -d

stop:
	docker-compose -f ./srcs/docker-compose.yml stop

down:
	docker-compose -f ./srcs/docker-compose.yml down

