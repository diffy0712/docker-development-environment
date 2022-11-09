ARG ADMINER_VERSION=4.8.1

FROM adminer:${ADMINER_VERSION}

USER root

COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT	["docker-entrypoint.sh"]

USER adminer

CMD ["php","-S","[::]:8080"]