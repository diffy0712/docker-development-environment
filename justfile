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

## See logs for containers. e.g.: just logs
logs:
	{{compose}} logs -f

## See logs for containers. e.g.: just log proxy
log SERVICE:
	{{compose}} logs {{SERVICE}} -f

## Get into interactive shell inside containers. e.g.: just sh proxy
sh SERVICE:
	{{compose}} exec {{SERVICE}} sh 