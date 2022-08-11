
all:
	cd srcs && sudo docker-compose up --build -d

clean :
	sudo docker rm -f $$(sudo docker ps -aq)

fclean: clean
	sudo docker rmi $$(sudo docker images -q)

re : fclean all

