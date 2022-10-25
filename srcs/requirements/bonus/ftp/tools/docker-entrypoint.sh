#!/bin/sh
set -xe

if ! id ${FTP_USER_NAME}; then
	adduser -h /var/www ${FTP_USER_NAME} << EOF
${FTP_USER_PASSWORD}
${FTP_USER_PASSWORD}
EOF
fi

chown -R ${FTP_USER_NAME}:${FTP_USER_NAME} /var/www

echo ${FTP_USER_NAME} > vsftpd.userlist

exec "$@"
