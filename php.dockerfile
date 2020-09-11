FROM php:7.4-fpm-alpine

WORKDIR /var/www/html

RUN docker-php-ext-install pdo pdo_mysql

ARG XDEBUG_VERSION=2.8.0beta1

RUN mkdir -p /usr/src/php/ext/xdebug && \
    curl -fsSL https://xdebug.org/files/xdebug-${XDEBUG_VERSION}.tgz | tar xz -C /usr/src/php/ext/xdebug --strip 1 && \
    docker-php-ext-install xdebug && \
    echo "xdebug.remote_enable=1" >> /usr/local/etc/php/php.ini
