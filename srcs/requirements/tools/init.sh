# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    init.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mannouao <mannouao@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/28 16:50:29 by mannouao          #+#    #+#              #
#    Updated: 2022/11/05 20:02:54 by mannouao         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

export $(cat ./srcs/.env | grep 'DOMAIN_NAME=' | xargs)

mkdir -p ${HOME}/data
sudo chown ${USER}:${USER} ${HOME}/data
mkdir -p ${HOME}/data/db \
	    ${HOME}/data/wordpress \
		${HOME}/data/portainerDB

if ! grep -q "$DOMAIN_NAME" /etc/hosts; then
	echo "127.0.0.1    $DOMAIN_NAME" | sudo tee -a /etc/hosts;
fi