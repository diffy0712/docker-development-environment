#!/bin/sh

cat /var/www/html/designs/ng9/adminer.css | \
    sed -e "s/#f2eee1/#${COLOR:-006aeb}/g" > \
    /var/www/html/adminer.css && \

exec "$@"