FROM php:7.4-fpm
RUN apt-get update && apt-get install -y \
libzip-dev \
zip \
unzip \
supervisor \
libpq-dev \
libpng-dev \
&& rm -rf /var/lib/apt/lists/*
RUN docker-php-ext-configure zip
RUN docker-php-ext-install gd
RUN docker-php-ext-install zip pdo_mysql
RUN docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql
RUN docker-php-ext-install pdo pdo_pgsql

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Add user for laravel application
RUN groupadd -g 1000 www
RUN useradd -u 1000 -ms /bin/bash -g www www

ADD ./websockets.conf /etc/supervisor/supervisor.conf

COPY ./entrypoint.sh /

CMD ["sh","/entrypoint.sh"]

# Copy existing application directory permissions
COPY --chown=www:www . /var/www

# Change current user to www
USER www
