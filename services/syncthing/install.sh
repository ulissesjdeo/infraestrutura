# https://hub.docker.com/r/syncthing/syncthing
# https://github.com/syncthing/syncthing/blob/main/README-Docker.md

# Criando diretorio
mkdir /infra/syncthing

# Criando container
docker run \
  -d \
  -it \
  --name=syncthing \
  --restart=unless-stopped \
  -e STGUIADDRESS=0.0.0.0:8384 \
  -p 8384:8384 \
  -p 22000:22000/tcp \
  -p 22000:22000/udp \
  -p 21027:21027/udp \
  -v /infra/syncthing:/var/syncthing \
  --hostname=syncthing \
  syncthing/syncthing:1.27 
