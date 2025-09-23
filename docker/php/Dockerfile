FROM php:8.3-fpm-alpine as app

# Useful PHP extension installer image, copy binary into your container
COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/

# RUN docker-php-ext-istall pdo pdo_mysql
RUN set -eux; \
    install-php-extensions \
    # Basic requirements for Symfony and Doctrine
    pdo \
    pdo_mysql \
    # Or pdo_pgsql if you use PostgreSQL
    # pdo_pgsql \
    # Required for many Symfony components and libraries
    intl \
    zip \
    gd \
    # For caching and session management
    opcache \
    apcu \
    # For cURL requests (e.g., HTTP clients, API integrations)
    curl \
    # For JSON handling (essential for APIs)
    json \
    # For XML processing (e.g., some configurations, third-party libraries)
    xml \
    # For mb_string functions (multibyte string handling)
    mbstring \
    # For YAML parsing (e.g., Symfony configurations)
    yaml \
    xsl \
    # For Xdebug (useful for debugging, remove in production)
    # xdebug \
    # If you use Redis for caching or sessions
    # redis \
    ;

#allow superuser(true), composer as superuser at all the time
ENV COMPOSER_ALLOW_SUPERUSER=1

# obtain composer using multi stage build
COPY --from=composer:2.8 /usr/bin/composer /usr/bin/composer

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
