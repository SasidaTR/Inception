FROM debian:bookworm

RUN apt update && apt install -y nginx openssl && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/nginx/ssl

COPY tools/init.sh /init.sh
COPY tools/nginx.conf /etc/nginx/nginx.conf

RUN chmod +x /init.sh

ENTRYPOINT ["/init.sh"]
