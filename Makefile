# Makefile - Basic Docker command wrappers
.PHONY: sf composer php pc mysql bash cache migrate npm dev watch build

# Symfony console
sf:
	docker compose exec php symfony console $(filter-out $@,$(MAKECMDGOALS))

# Composer
composer:
	docker compose exec php composer $(filter-out $@,$(MAKECMDGOALS))

# PHP
php:
	docker compose exec php php $(filter-out $@,$(MAKECMDGOALS))

# PHP Console (Symfony)
pc:
	docker compose exec php symfony console $(filter-out $@,$(MAKECMDGOALS))

# Database
mysql:
	docker compose exec db mysql -u root -p

# Shell access
bash:
	docker compose exec php bash

# Node.js commands
npm:
	docker compose exec php npm $(filter-out $@,$(MAKECMDGOALS))

# Common shortcuts
cache:
	docker compose exec php symfony console cache:clear

migrate:
	docker compose exec php symfony console doctrine:migrations:migrate

dev:
	docker compose exec php npm run dev

watch:
	docker compose exec php npm run watch

build:
	docker compose exec php npm run build

# Prevent make from treating arguments as targets
%:
	@: