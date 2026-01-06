# User Documentation

## Services
- NGINX (TLS reverse proxy)
- WordPress (PHP-FPM)
- MariaDB (database)

## Start / Stop
```bash
make
docker compose down
```

## Access
- Website: https://trischma.42.fr
- Admin panel: https://trischma.42.fr/wp-admin

## Credentials
Credentials are stored using Docker secrets and environment variables.

## Health Check
```bash
docker ps
```
