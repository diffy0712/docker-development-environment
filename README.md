## Docker development environment

I prefer to do my development in dockerized environments and this repository just helps me to run my projects behing a reverse proxy so I can assign a hostname to my projects and I dont have to rememeber ports for different projects.
Also this project will serve my postgres database (as my projects rely on postgres) and also a client for sonarcube.

## Commands to control the environment

I prefer to use a `justfile` to create an alias for managing the environment.

 - `just --list` will show all available commands
 - `just start` will start the environment
 - `just stop` will stop the environment
 - `just logs` will show logs for the environment

## How to use inside projects
TODO


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