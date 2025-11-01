# Makefile - Basic Docker command wrappers
.PHONY: sf composer php pc mysql bash cache migrate npm dev watch build

# Symfony console
sc:
	docker compose exec php symfony console $(filter-out $@,$(MAKECMDGOALS))

# Composer
composer:
	docker compose exec php composer $(filter-out $@,$(MAKECMDGOALS))

# PHP
php:
	docker compose exec php php $(filter-out $@,$(MAKECMDGOALS))

# PHP Console (Symfony)
pc:
	docker compose exec php php bin/console $(filter-out $@,$(MAKECMDGOALS))

# Database
mysql:
	docker compose exec database mysql -u root -p

# Shell access
bash:
	docker compose exec php bash

# Node.js commands
npm:
	docker compose exec node npm $(filter-out $@,$(MAKECMDGOALS))

# Common shortcuts
cache:
	docker compose exec php symfony console cache:clear

# Common shortcuts
cache:
	docker compose exec php symfony console cache:clear

migration:
	docker compose exec php symfony console make:migration

migrate:
	docker compose exec php symfony console doctrine:migrations:migrate

dev:
	docker compose exec node npm run dev

watch:
	docker compose exec node npm run watch

build:
	docker compose exec node npm run build

# Prevent make from treating arguments as targets
%:
	@: