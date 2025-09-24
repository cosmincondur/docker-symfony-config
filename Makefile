# Makefile - Basic Docker command wrappers
.PHONY: sf composer php mysql bash cache migrate

# Symfony console
sf:
	docker compose exec php symfony console $(filter-out $@,$(MAKECMDGOALS))

# Composer
composer:
	docker compose exec php composer $(filter-out $@,$(MAKECMDGOALS))

# PHP
php:
	docker compose exec php php $(filter-out $@,$(MAKECMDGOALS))

# Node.js commands
npm:
	docker compose exec php npm $(filter-out $@,$(MAKECMDGOALS))

# Database
mysql:
	docker compose exec db mysql -u root -p

# Shell access
bash:
	docker compose exec app bash

# Common shortcuts
cache:
	docker compose exec app php bin/console cache:clear

migrate:
	docker compose exec app php bin/console doctrine:migrations:migrate

# Prevent make from treating arguments as targets
%:
	@:
