# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mannouao <mannouao@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/28 16:50:29 by mannouao          #+#    #+#              #
#    Updated: 2022/10/28 16:57:20 by mannouao         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
	sudo mkdir -p ${HOME}/data/db \
	              ${HOME}/data/wordpress \
		      ${HOME}/data/portainerDB
	cd srcs && docker-compose up -d

clean:
	cd srcs && docker-compose down

fclean: clean
	docker container prune -f
	docker image prune -af

restart: fclean
	docker system prune -af --volumes
	sudo rm -rf ${HOME}/data/db ${HOME}/data/wordpress ${HOME}/data/portainerDB

git:
	git add .
	git commit -m " back Up "
	git push
