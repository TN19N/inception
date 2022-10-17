all:
	sudo mkdir -p /home/mannouao/data/db /home/mannouao/data/wordpress
	cd srcs && sudo docker compose up --build -d
clean:
	cd srcs && sudo docker compose down
	sudo docker container prune -f
	sudo docker image prune -af
restart:
	sudo rm -rf /home/mannouao/data/*
