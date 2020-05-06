# Runtime image
FROM php:7.4.5-apache

# Log PHP Errors
RUN echo 'log_errors = On' > /usr/local/etc/php/conf.d/custom.ini \
    echo 'error_log = /dev/stderr' >> /usr/local/etc/php/conf.d/custom.ini

RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli

# Enable rewrite
RUN a2enmod rewrite

# Update apache root
ENV APACHE_DOCUMENT_ROOT /var/www/html/web/
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf
