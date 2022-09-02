run: build
	sudo docker-compose -f srcs/docker-compose.yml up

build:
	sudo docker-compose -f srcs/docker-compose.yml build

clean:
	sudo docker container prune -f

fclean: clean
	sudo docker image prune -a
