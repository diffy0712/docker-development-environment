## Docker development environment

I prefer to do my development in dockerized environments and this repository just helps me to run my projects behing a reverse proxy so I can assign a hostname to my projects and I dont have to rememeber ports for different projects.
Also this project will serve my postgres database (as my projects rely on postgres) and also a client for sonarcube.

 - [Nginx reverse proxy](https://hub.docker.com/r/jwilder/nginx-proxy)
 - [Sonarcube](https://hub.docker.com/_/sonarqube)
 - [Postgres](https://hub.docker.com/_/postgres)
 - [Adminer](https://hub.docker.com/_/adminer)

## Commands to control the environment

I prefer to use a `justfile` to create an alias for managing the environment.

 - `just --list` will show all available commands
 - `just start` will start the environment
 - `just stop` will stop the environment
 - `just logs` will show logs for the environment

## How to use inside projects
The development environment uses the network `development-environment_shared` so if you want to access the database you might need to use that network.

To the reverse proxy to be able to route the request for the correct host to this container you must provide the `VIRTUAL_HOST` (and if port is not 80 `VIRTUAL_PORT`) environment variable(s).


Example docker-compose.yml for a webpack development server
```
services:
  nodejs:
    image: node:18.4.0-buster-slim
    command: sh -lc "npm install && npm start"
    working_dir: /app
    environment:
      VIRTUAL_HOST: example.test ## /etc/hosts should be set so example.test or whaterver is pointing to localhost
      VIRTUAL_PORT: 3000 ## whaterver port the development server is running on.
    volumes:
      - ./:/app
    networks:
      - development-environment_shared

networks:
  development-environment_shared:
    external: true
```


## Sonarcube

An example to run sonar-scanner.

Note: you must provide a correct `projectKey` and `login`.

```
sonar-scanner \
    -Dsonar.projectKey= \
    -Dsonar.sources=src \
    -Dsonar.javascript.lcov.reportPaths=./coverage/lcov.info \
    -Dsonar.host.url=http://sonarcube.test \
    -Dsonar.login= \
    -Dsonar.exclusions=src/**/*.test.*
```