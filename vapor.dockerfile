FROM php:7.4-fpm-alpine

RUN apk add --no-cache zip libzip-dev
RUN docker-php-ext-configure zip
RUN docker-php-ext-install zip
RUN apk add icu-dev g++
RUN docker-php-ext-configure intl
RUN docker-php-ext-install pdo pdo_mysql intl

RUN apk add --update npm

COPY --from=composer /usr/bin/composer /usr/bin/composer
ENV COMPOSER_HOME /composer
ENV PATH /composer/vendor/bin:$PATH
ENV COMPOSER_ALLOW_SUPERUSER 1
RUN composer --ansi global require laravel/vapor-cli
