all:
	sudo mkdir -p ${HOME}/data/db \
	              ${HOME}/data/wordpress \
		      ${HOME}/data/portainerDB
	cd srcs && sudo docker compose up --build -d
clean:
	cd srcs && sudo docker compose down
fclean: clean
	sudo docker container prune -f
	sudo docker image prune -af
restart: fclean
	sudo docker system prune -af --volumes
	sudo rm -rf ${HOME}/data/*
git:
	sudo git add .
	sudo git commit -m " back Up "
	sudo git push
