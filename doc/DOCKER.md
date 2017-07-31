# docker

## table of contents
- [setup](#setup)
  - [docker project name](#docker-project-name)
  - [new database install](#new-database-install)
  - [application config](#application-config)
  - [database config](#database-config)
- [running the application](#running-the-application)


## setup
### docker project name
make sure a file named `.env` exists in the root of the application with the environment variable `COMPOSE_PROJECT_NAME` set to a docker project name you wish to use. the file in the repo is set to `foodsoft`.

### new database install
add an empty file named `.new-install` to the root of the application. when the docker web container runs `docker-entrypoint.sh` it will run `rake db:setup` and delete the file once the rake task completes successfully.

### application config
make sure you have copied the following SAMPLE files and adjusted values as necessary within them:

```sh
cp config/database.yml.MySQL_SAMPLE config/database.yml
cp config/app_config.yml.SAMPLE config/app_config.yml
cp config/environments/development.rb.SAMPLE config/environments/development.rb
cp config/initializers/secret_token.rb.SAMPLE config/initializers/secret_token.rb
cp docker/dev/.env.SAMPLE docker/dev/.env 
cp docker/prod/.env.SAMPLE docker/prod/.env
```

### database config
in the `config/database.yml` file make sure you adjust the following settings as appropriate:

```sh
host: foodsoft_mysql_1
socket: /tmp/mysql.sock
password: <password set in the docker/<env>/.env file>
```

## running the application
from the root of the application, use docker-compose to start-up and tear-down the application using the `<env>` folder to determine which environment you want to start.

```sh
docker-compose -f docker/dev/docker-compose.yml up
docker-compose -f docker/dev/docker-compose.yml down
```
