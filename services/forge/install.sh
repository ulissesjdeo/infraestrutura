# https://docker-minecraft-server.readthedocs.io/

mkdir -p /infra/forge

docker run \
  -itd \
  --restart unless-stopped \
  -p 48255:25565 \
  \
  -e EULA=TRUE \
  -e TYPE=FORGE \
  -e VERSION=1.16.5 \
  -e FORGEVERSION=36.2.42 \
  \
  -v /infra/forge:/data \
  \
  --name forge \
  itzg/minecraft-server:java8
