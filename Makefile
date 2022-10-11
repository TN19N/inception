all:
	sudo ./srcs/requirements/tools/init.sh
	cd srcs && sudo docker compose up --build -d
clean:
	cd srcs && sudo docker compose down
	sudo docker container prune -f
	sudo docker image prune -af
restart:
	sudo rm -rf /home/mannouao/data/*
