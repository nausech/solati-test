#!/bin/bash

# cron -f &
# php /var/www/html/autocom-back/artisan websockets:serve &
supervisord -c  /etc/supervisor/supervisor.conf &
docker-php-entrypoint php-fpm








