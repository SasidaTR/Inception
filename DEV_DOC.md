# Developer Documentation
## Requirements

- Debian virtual machine
- Docker
- Docker Compose
- Make

## Setup

- Cloner le dépôt
- Créer et remplir srcs/.env
- Ajouter les secrets dans le dossier secrets/
- Aucun secret ne doit être présent en clair dans le dépôt

## Build & Run

Construire et lancer toute l’infrastructure :
```bash
make
```

## Management

Lister les containers :
```bash
docker compose ps
```

Voir les logs :
```bash
docker compose logs
```

Arrêter et supprimer containers + volumes :
```bash
docker compose down -v
```

## Data Persistence

- Données MariaDB stockées dans un volume Docker
- Fichiers WordPress stockés dans un volume Docker
- Volumes persistants situés sur l’hôte dans /home/trischma/data