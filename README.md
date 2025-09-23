# docker-symfony-config

## 🚀 Useful Docker Commands

These are helpful commands to manage your development environment.

| Command | What it does |
|---------|---------------|
Open a shell inside the `app` (PHP) container. Use this to run console commands, inspect files, etc.
| `docker-compose -f docker-compose.dev.yaml exec app sh`

Stops all containers and removes associated volumes. Useful when you want a clean start, especially removing database/data volumes.
| `docker-compose -f docker-compose.dev.yaml down -v`

Builds the images (if Dockerfiles changed) and starts containers in detached mode. Use this after making changes to Dockerfile or configuration.
| `docker-compose -f docker-compose.dev.yaml up -d --build`