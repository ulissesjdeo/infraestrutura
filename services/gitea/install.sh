# https://docs.gitea.com/installation/install-with-docker

echo "=== CRIANDO PASTAS"
mkdir -p /infra/gitea

until docker exec postgres pg_isready -q; do sleep 5; done

echo "=== CRIANDO BANCO DE DADOS"
docker exec -it postgres psql -U postgres -c "CREATE DATABASE gitea;" 2> /dev/null

echo "=== CRIANDO CONTAINER"
docker run \
  -d \
  --restart unless-stopped \
  \
  -e USER_UID=1000 \
  -e USER_GID=1000 \
  -e GITEA__database__NAME=gitea \
  -e GITEA__database__HOST=172.18.0.2 \
  -e GITEA__database__USER=postgres \
  -e GITEA__database__DB_TYPE=postgres \
  -e GITEA__database__PASSWD=mysecretpassword \
  \
  --network nginx \
  --ip 172.19.0.5 \
  \
  -v /infra/gitea:/data \
  -v /etc/timezone:/etc/timezone:ro \
  -v /etc/localtime:/etc/localtime:ro \
  \
  --name gitea \
  gitea/gitea:1.22.2 1> /dev/null

echo "=== CONECTANDO CONTAINER À REDE DO BANCO"
docker network connect postgres gitea 1> /dev/null
