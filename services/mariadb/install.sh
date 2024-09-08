# https://hub.docker.com/_/mariadb

mkdir -p /infra/mariadb

docker run \
  -d \
  \
  --env MARIADB_ROOT_PASSWORD=my-secret-pw \
  \
  --name mariadb \
  mariadb:11.5.2-ubi9
