all:
	cd srcs && sudo docker-compose up --build
clean:
	sudo docker container prune -f
	sudo docker image prune -af
re: clean all
