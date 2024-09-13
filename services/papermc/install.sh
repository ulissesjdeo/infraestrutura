# https://hub.docker.com/r/marctv/minecraft-papermc-server

echo "=== CRIANDO PASTAS"
mkdir -p /infra/papermc

echo "=== CRIANDO CONTAINER"
docker run \
  -d \
  --restart unless-stopped \
  -p 25565:25565/tcp \
  -p 25565:25565/udp \
  \
  -e PUID=0 \
  -e PGID=0 \
  -e MEMORYSIZE="4G" \
  -e PAPERMC_FLAGS='' \
  \
  -v /infra/papermc:/data:rw \
  --name papermc \
  marctv/minecraft-papermc-server:1.21.1-77 1> /dev/null
