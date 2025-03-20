FROM php:8.4-fpm
ADD code /var/www/html
RUN docker-php-ext-install mysqli pdo pdo_mysql

