#!/bin/sh
set -e

adduser -h /var/www ${FTP_USER_NAME} << EOF
${FTP_USER_PASSWORD}
${FTP_USER_PASSWORD}
EOF

chown -R ${FTP_USER_NAME}:${FTP_USER_NAME} /var/www

echo ${FTP_USER_NAME} > vsftpd.userlist

rm -f docker-entrypoint.sh
exec "$@"
