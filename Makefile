all:
	sudo mkdir -p /home/mannouao/data/db /home/mannouao/data/wordpress
	cd srcs && sudo docker compose up --build -d
clean:
	cd srcs && sudo docker compose down
	sudo docker container prune -f
fclean: clean
	sudo docker image prune -af
restart: fclean
	sudo rm -rf /home/mannouao/data/*
re: fclean all
git:
	sudo git add .
	sudo git commit -m " back Up "
	sudo git push
