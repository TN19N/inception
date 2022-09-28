#!/bin/sh

envsubst < init.sql.template > init.sql

rm -rf init.sql.template

mysql_install_db --user=mysql --datadir=/var/lib/mysql > /dev/null

mysqld --user=mysql --init-file=/etc/mysql/init.sql --skip-networking=0
