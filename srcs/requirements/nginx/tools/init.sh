#!/bin/sh
set -e

if [ ! -f /etc/nginx/ssl/nginx.crt ]; then
	openssl req -x509 -nodes -newkey rsa:2048 -days 365 \
		-keyout /etc/nginx/ssl/nginx.key \
		-out /etc/nginx/ssl/nginx.crt \
		-subj "/CN=${DOMAIN_NAME}"
fi

exec nginx -g "daemon off;"
