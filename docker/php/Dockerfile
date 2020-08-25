FROM php:7.4-fpm
COPY php.ini /usr/local/etc/php/

RUN apt-get update \
  && apt-get install -y \
    libzip-dev \
    mariadb-client \
    vim \
    procps \
    iputils-ping \
    net-tools \
    unzip \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && docker-php-ext-install \
    zip \
    pdo_mysql \
  && pecl install xdebug \
  && docker-php-ext-enable xdebug
#Composer install
COPY --from=composer /usr/bin/composer /usr/bin/composer
ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_HOME /composer
ENV PATH $PATH:/composer/vendor/bin
ENV PS1 "\[\e[34m\]\u\[\e[33m\]@docker\[\e[32m\]:\w\$\[\e[0m\]"

WORKDIR /var/www
RUN composer global require "laravel/installer"
# composer.json not found
# RUN composer install && php artisan key:generate

# add alias and etc
COPY .bashrc /root/
COPY .inputrc /root/
