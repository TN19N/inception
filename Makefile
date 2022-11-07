# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mannouao <mannouao@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/28 16:50:29 by mannouao          #+#    #+#              #
#    Updated: 2022/11/07 09:35:16 by mannouao         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
	sh ./srcs/requirements/tools/init.sh
	cd srcs && docker-compose up -d --build

clean:
	cd srcs && docker-compose down

fclean: clean
	docker container prune -f
	docker image prune -af

restart: fclean
	docker system prune -af --volumes
	rm -rf ${HOME}/data/db ${HOME}/data/wordpress ${HOME}/data/portainerDB