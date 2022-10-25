#!/bin/sh
set -xe

envsubst < init.sql.template > init.sql

exec "$@"
