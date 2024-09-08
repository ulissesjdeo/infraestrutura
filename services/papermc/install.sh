# https://hub.docker.com/r/marctv/minecraft-papermc-server

mkdir -p /infra/papermc

docker run \
  -d \
  --restart unless-stopped \
  -p 25565:25565/tcp \
  -p 25565:25565/udp \
  \
  -e MEMORYSIZE="4G" \
  \
  -v /infra/papermc:/data:rw \
  --name papermc \
  marctv/minecraft-papermc-server:1.21.1-69
