FROM debian:bullseye

# Instalamos dependencias necesarias
RUN apt-get update && apt-get install -y \
    apache2 \
    php \
    php-mysql \
    php-xml \
    php-gd \
    php-mbstring \
    php-bz2 \
    php-curl \
    php-intl \
    php-soap \
    php-sqlite3 \
    php-zip \
    php-xsl \
    unzip \
    wget

# Descargar PMB
WORKDIR /var/www/html
RUN wget https://forge.sigb.net/attachments/download/4845/pmb8.0.1.0.zip -O pmb.zip && \
    unzip pmb.zip && rm pmb.zip

# Configurar permisos
RUN chown -R www-data:www-data /var/www/html

# Configurar PHP
RUN echo "date.timezone = Europe/Paris" >> /etc/php/7.4/apache2/php.ini && \
    echo "memory_limit = 256M" >> /etc/php/7.4/apache2/php.ini && \
    echo "max_execution_time = 300" >> /etc/php/7.4/apache2/php.ini && \
    echo "max_input_vars = 50000" >> /etc/php/7.4/apache2/php.ini && \
    echo "post_max_size = 64M" >> /etc/php/7.4/apache2/php.ini && \
    echo "upload_max_filesize = 64M" >> /etc/php/7.4/apache2/php.ini

# Exponer el puerto 80
EXPOSE 80

# Iniciar Apache
CMD ["apachectl", "-D", "FOREGROUND"]
