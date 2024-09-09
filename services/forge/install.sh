# https://docker-minecraft-server.readthedocs.io/

mkdir /infra/forge

docker run \
  -itd \
  --restart unless-stopped \
  -p 25565:25565 \
  \
  -e EULA=TRUE \
  -e TYPE=FORGE \
  -e VERSION=1.12.2 \
  -e FORGEVERSION=14.23.5.2860 \
  \
  -v /infra/forge:/data \
  \
  --name forge \
  itzg/minecraft-server:java8
