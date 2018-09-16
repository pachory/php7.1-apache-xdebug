FROM php:7.1-apache

RUN apt-get update

# vim インストール
RUN apt-get install -y vim

# php 拡張のインストール
RUN apt-get install -y libicu-dev libpq-dev
RUN docker-php-ext-install intl pdo pdo_pgsql mbstring

# Xdebug のインストール
RUN pecl install xdebug

# apacheのrewriteを有効にする
RUN a2enmod rewrite
COPY ./apache/sites-available/000-default.conf /etc/apache2/sites-available/

# php.ini への設定追加
ADD ./php/php-extention.ini /usr/local/etc/php/conf.d/

EXPOSE 80