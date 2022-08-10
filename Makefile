
all:
	cd srcs && sudo docker-compose up --build

clean :
	sudo docker rm $$(sudo docker ps -aq)

fclean: clean
	sudo docker rmi $$(sudo docker images -q)

re : fclean all

