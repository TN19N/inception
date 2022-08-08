
all:
	cd srcs && sudo docker-compose up --build -d

clean :
	cd srcs && sudo docker-compose down

fclean: clean
	sudo docker rmi $$(sudo docker images -q)

re : fclean all

