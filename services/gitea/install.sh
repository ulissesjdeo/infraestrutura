# https://docs.gitea.com/installation/install-with-docker

mkdir -p /infra/gitea

until docker exec postgres pg_isready ; do sleep 2 ; done

docker exec -it postgres psql -U postgres -c "CREATE DATABASE gitea;"

docker run \
  -d \
  --restart unless-stopped \
  -p 10881:3000 \
  -p 10023:22 \
  \
  -e USER_UID=1000 \
  -e USER_GID=1000 \
  -e GITEA__database__NAME=gitea \
  -e GITEA__database__HOST=172.18.0.1 \
  -e GITEA__database__USER=postgres \
  -e GITEA__database__DB_TYPE=postgres \
  -e GITEA__database__PASSWD=mysecretpassword \
  \
  -v /infra/gitea:/data \
  -v /etc/timezone:/etc/timezone:ro \
  -v /etc/localtime:/etc/localtime:ro \
  \
  --name gitea \
  gitea/gitea:1.22.2

docker network connect postgres gitea
