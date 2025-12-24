#!/bin/sh
openssl req -x509 -nodes -newkey rsa:2048 -days 365 \
	-keyout /etc/nginx/ssl/nginx.key \
	-out /etc/nginx/ssl/nginx.crt \
	-subj "/CN=trischma.42.fr"
nginx -g "daemon off;"
