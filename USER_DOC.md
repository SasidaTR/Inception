# User Documentation
## Services

- NGINX: Reverse proxy HTTPS (TLSv1.2 / TLSv1.3), point d’entrée unique sur le port 443
- WordPress: Application web exécutée via PHP-FPM
- MariaDB: Base de données utilisée par WordPress

## Start / Stop

Démarrer l’infrastructure :
```bash
make
```

Arrêter et supprimer les containers :
```bash
docker compose down
```

## Access

- Website: https://trischma.42.fr
- Admin panel: https://trischma.42.fr/wp-admin

## Credentials

- Les variables d’environnement sont définies dans srcs/.env
- Les mots de passe sensibles sont stockés via Docker secrets
- Les secrets sont montés dans les containers et ne sont pas présents en clair dans le dépôt Git

## Data persistence

- Les données WordPress sont stockées dans un volume Docker
- La base de données MariaDB est stockée dans un volume Docker
- Les deux volumes sont situés sur l’hôte dans /home/trischma/data

## Health Check

Vérifier que les containers sont actifs :
```bash
docker ps
```

Vérifier l’état détaillé des services :
```bash
docker compose ps
```

Tester l’accès HTTPS :
```bash
curl -k https://trischma.42.fr

```