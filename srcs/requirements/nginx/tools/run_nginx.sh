
#!/bin/sh

export DOLLAR="$"

envsubst < default.templat > default.conf

/usr/sbin/nginx

