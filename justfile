compose := "docker compose"

## Start the environment
start:
	{{compose}} up -d

## Restart the environemnt
restart: down start

## Stop the environment
stop:
	{{compose}} stop

## Down the environment
down:
	{{compose}} down -v

## See logs of the environment, arg c for containers. e.g.: make logs c=proxy
logs:
	{{compose}} logs -f $(c)

## See logs of the environment, arg c for containers. e.g.: make logs c=proxy
sh:
	{{compose}} exec $(c) sh 