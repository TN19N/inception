#!/bin/sh
set -e

envsubst < init.sql.template > init.sql

rm -rf init.sql.template docker-entrypoint.sh
exec "$@"
