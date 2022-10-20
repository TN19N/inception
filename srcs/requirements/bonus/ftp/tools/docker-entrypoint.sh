#!/bin/sh
set -e

adduser -H ${FTP_USER_NAME} << EOF
${FTP_USER_PASSWORD}
${FTP_USER_PASSWORD}
EOF

echo ${FTP_USER_NAME} >> vsftpd.userlist

rm -f docker-entrypoint.sh
exec "$@"
