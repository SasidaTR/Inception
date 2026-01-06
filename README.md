*This project has been created as part of the 42 curriculum by trischma.*

## Description
This project deploys a Docker-based WordPress stack using NGINX (TLS), PHP-FPM, and MariaDB.
It focuses on security, isolation, and service modularity.

## Instructions
```bash
make
```
Access: https://trischma.42.fr

## Project Design
- Virtual Machines vs Docker: VM for hosting, Docker for service isolation.
- Secrets vs Environment Variables: secrets for sensitive data, env vars for configuration.
- Docker Network vs Host Network: dedicated Docker network for isolation.
- Docker Volumes vs Bind Mounts: volumes for data persistence.

## Resources
- Docker documentation
- Docker Compose documentation
- 42 Inception subject
- AI usage: documentation drafting, structure, and compliance verification.
