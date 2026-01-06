# Developer Documentation

## Requirements
- Debian VM
- Docker
- Docker Compose
- Make

## Setup
Clone the repository and configure `.env` and `secrets/`.

## Build & Run
```bash
make
```

## Management
```bash
docker compose ps
docker compose logs
docker compose down -v
```

## Data Persistence
- MariaDB data: Docker volume
- WordPress files: Docker volume
