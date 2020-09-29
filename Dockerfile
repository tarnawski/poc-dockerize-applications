################## DEVELOP ###########################

FROM composer:2.0 AS composer-dev
COPY . /app
RUN composer install --no-suggest --no-interaction

FROM php:7.4-fpm AS php-dev
# Install XDebug etc
WORKDIR /var/www/html
COPY . /var/www/html
COPY --from=composer-dev /app/vendor /var/www/html

################# PRODUCTION #########################

FROM composer:2.0 AS composer-prod
COPY . /app
RUN composer install --no-dev --no-scripts --no-suggest --no-interaction --prefer-dist --optimize-autoloader

FROM php:7.4-fpm AS php-prod
COPY --from=composer-prod /app/vendor /var/www/html

FROM nginx:stable AS nginx
COPY config/nginx.conf /etc/nginx/conf.d/default.conf
# If assest are generated from application (ex. symfony command to dump assets)
# we need copy this assets from previous stage
COPY public/assets /var/www/html/public/assets
EXPOSE 80


