all:
	@ cd srcs && sudo docker-compose up --build -d
clean:
	@ cd srcs && sudo docker-compose down
	@ sudo docker container prune -f
	@ sudo docker image prune -af
re: clean all
