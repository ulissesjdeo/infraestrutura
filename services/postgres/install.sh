# https://hub.docker.com/_/postgres

# Criando diretorio
mkdir /infra/postgres

# Criando container
docker run \
  -d \
  -it \
  -e PGDATA=/var/lib/postgresql/data/pgdata \
  -v /infra/postgres:/var/lib/postgresql/data \
  --restart=unless-stopped \
  --name postgres \
  -e POSTGRES_PASSWORD=mysecretpassword \
  postgres:16.4-alpine3.20
