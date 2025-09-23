FROM php:8.4-fpm as app

# Useful PHP extension installer image, copy binary into your container
COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/

# Install PHP extensions
RUN set -eux; \
    install-php-extensions \
    pdo \
    pdo_mysql \
    intl \
    zip \
    gd \
    opcache \
    apcu \
    curl \
    json \
    xml \
    mbstring \
    yaml \
    xsl \
    ;

# Install curl, bash, and Symfony CLI
RUN apt-get update && apt-get install -y curl bash && rm -rf /var/lib/apt/lists/*
RUN curl -sS https://get.symfony.com/cli/installer | bash
RUN mv /root/.symfony5/bin/symfony /usr/local/bin/symfony

#allow superuser(true), composer as superuser at all the time
ENV COMPOSER_ALLOW_SUPERUSER=1

# obtain composer using multi stage build
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# we copy only composer files instead of entire source
COPY ./composer.* ./

RUN composer install --prefer-dist --no-dev --no-scripts --no-progress --no-interaction

# copy app files to working dir
COPY . .

RUN composer dump-autoload --optimize

# app_dev is alias
FROM app as app_dev

ENV XDEBUG_MODE=off

#copy xdebug config file into container
#localPath containerPath
COPY ./docker/php/conf.d/xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini

RUN set -eux; \
	install-php-extensions xdebug
