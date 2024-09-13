# https://hub.docker.com/_/nginx

echo "=== CRIANDO PASTAS"
mkdir -p /infra/nginx

echo "=== CRIANDO REDE"
docker network create --subnet=172.19.0.0/16 nginx 1> /dev/null

echo "=== CRIANDO CONTAINER"
docker run \
  -d \
  --restart unless-stopped \
  -p 80:80 \
  \
  --network nginx \
  --ip 172.19.0.2 \
  \
  -v /infra/nginx:/etc/nginx \
  \
  --name nginx \
  nginx:1.27.1-bookworm 1> /dev/null
