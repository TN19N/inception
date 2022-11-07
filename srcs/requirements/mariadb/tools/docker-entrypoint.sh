# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    docker-entrypoint.sh                               :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mannouao <mannouao@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/28 16:50:29 by mannouao          #+#    #+#              #
#    Updated: 2022/11/07 09:38:22 by mannouao         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh
set -xe

mysql_install_db --user=mysql --datadir=/var/lib/mysql
envsubst < init.sql.template > init.sql

exec "$@"