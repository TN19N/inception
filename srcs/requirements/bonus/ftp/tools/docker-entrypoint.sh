# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    docker-entrypoint.sh                               :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mannouao <mannouao@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/28 16:50:29 by mannouao          #+#    #+#              #
#    Updated: 2022/10/29 11:15:55 by mannouao         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh
set -xe

if ! id -u ${FTP_USER_NAME}; then
	adduser -h /var/www/wordpress -D ${FTP_USER_NAME}
	echo "$FTP_USER_NAME:$FTP_USER_PASSWORD" | chpasswd
fi

chmod -R o+rw /var/www/wordpress
echo ${FTP_USER_NAME} > vsftpd.userlist

exec "$@"