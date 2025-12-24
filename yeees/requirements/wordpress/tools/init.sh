#!/bin/sh
DB_PASS=$(cat /run/secrets/db_password)

until mysql -h mariadb -u wp_user -p"$DB_PASS" wp_db >/dev/null 2>&1
do
	sleep 1
done

mkdir -p /run/php
wget -q https://wordpress.org/latest.tar.gz -O /tmp/wp.tar.gz
tar -xf /tmp/wp.tar.gz -C /tmp
cp -r /tmp/wordpress/* /var/www/html/
rm -rf /tmp/wp.tar.gz /tmp/wordpress

cat > /var/www/html/wp-config.php <<EOF
<?php
define('DB_NAME', 'wp_db');
define('DB_USER', 'wp_user');
define('DB_PASSWORD', '${DB_PASS}');
define('DB_HOST', 'mariadb');
define('DB_CHARSET', 'utf8mb4');
define('DB_COLLATE', '');
\$table_prefix = 'wp_';
define('WP_DEBUG', false);
if (!defined('ABSPATH'))
	define('ABSPATH', __DIR__ . '/');
require_once ABSPATH . 'wp-settings.php';
EOF

chmod 644 /var/www/html/wp-config.php

exec php-fpm8.2 -F --nodaemonize --fpm-config /etc/php/8.2/fpm/pool.d/www.conf
