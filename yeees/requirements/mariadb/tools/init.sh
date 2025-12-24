#!/bin/sh
set -e

DB_PASS=$(cat /run/secrets/db_password)
ROOT_PASS=$(cat /run/secrets/db_root_password)

mkdir -p /var/run/mysqld
chown -R mysql:mysql /var/run/mysqld
chown -R mysql:mysql /var/lib/mysql

if [ ! -d /var/lib/mysql/mysql ]; then
	mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
	mysqld --user=mysql --skip-networking &
	while ! mysqladmin ping --silent; do
		sleep 1
	done
	mysql -u root <<EOF
ALTER USER 'root'@'localhost' IDENTIFIED BY '${ROOT_PASS}';
CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${DB_PASS}';
GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';
FLUSH PRIVILEGES;
EOF
	mysqladmin -u root -p${ROOT_PASS} shutdown
fi

exec su -s /bin/sh mysql -c "mysqld"
