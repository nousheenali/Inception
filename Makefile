path = /home/nali/data

all: volume build

volume:
	mkdir -p ${path} ${path}/mariadb ${path}/wordpress

up:
	docker-compose -f ./srcs/docker-compose.yml up -d

build: 
	docker-compose -f ./srcs/docker-compose.yml up -d --build

stop:
	docker-compose -f ./srcs/docker-compose.yml stop

down:
	docker-compose -f ./srcs/docker-compose.yml down

re:	down volume build

clean: down
	docker system prune -a
	@volumes=$$(docker volume ls -q); \
    if [ -n "$$volumes" ]; then \
        docker volume rm $$volumes; \
	fi

fclean: clean
	rm -rf ${path} ${path}/mariadb ${path}/wordpress
	
.PHONY	: all build down re clean fclean