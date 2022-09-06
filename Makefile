run: build
	cd ./srcs && sudo docker-compose up -d

build:
	cd ./srcs && sudo docker-compose build

clean:
	sudo docker container prune -f

fclean: clean
	sudo docker image prune -fa
