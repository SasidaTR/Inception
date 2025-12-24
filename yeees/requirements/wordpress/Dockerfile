FROM debian:bookworm

RUN apt update && apt install -y php-fpm php-mysql mariadb-client wget && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/www/html

COPY tools/www.conf /etc/php/8.2/fpm/pool.d/www.conf
COPY tools/init.sh /init.sh
RUN chmod +x /init.sh

WORKDIR /var/www/html

ENTRYPOINT ["/init.sh"]
