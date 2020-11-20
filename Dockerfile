# Dockerfile
FROM php:7-apache
MAINTAINER SemaphoreCI <dev@example.com>

COPY 000-default.conf /etc/apache2/sites-available/000-default.conf
COPY start-apache /usr/local/bin
RUN a2enmod rewrite

# Copy application source
COPY src /var/www/
RUN chown -R www-data:www-data /var/www
#CMD ["executable","param1","param2"]
CMD ["start-apache"]

RUN apt-get update && \
    apt-get install nodejs
