#!/bin/sh

envsubst < default.templat > default.conf

/usr/sbin/nginx

