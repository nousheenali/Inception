path = /home/nali/data

all: volume up

volume:
	mkdir -p ${path} ${path}/mariadb ${path}/wordpress

build:
	docker-compose -f ./srcs/docker-compose.yml --env-file ./srcs/.env build

up: 
	docker-compose -f ./srcs/docker-compose.yml --env-file ./srcs/.env up --build -d

stop:
	docker-compose -f ./srcs/docker-compose.yml --env-file ./srcs/.env stop

down:
	docker-compose -f ./srcs/docker-compose.yml --env-file ./srcs/.env down

re:	down volume up

clean: down
	docker system prune -a
	@volumes=$$(docker volume ls -q); \
    if [ -n "$$volumes" ]; then \
        docker volume rm $$volumes; \
	fi

fclean: clean
	rm -rf ${path} ${path}/mariadb ${path}/wordpress
	
.PHONY	: all build down re clean fclean