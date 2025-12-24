FROM debian:bookworm

RUN apt update && apt install -y mariadb-server mariadb-client && rm -rf /var/lib/apt/lists/*

COPY tools/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/init.sh /init.sh
RUN chmod +x /init.sh

ENTRYPOINT ["/init.sh"]
