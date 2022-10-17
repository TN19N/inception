#!/bin/sh
set -e

rm -f  docker-entrypoint.sh

exec "$@"
