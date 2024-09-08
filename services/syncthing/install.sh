# https://hub.docker.com/r/syncthing/syncthing

mkdir -p /infra/syncthing

docker run \
  -itd \
  --restart unless-stopped \
  -p 22000:22000/tcp \
  -p 22000:22000/udp \
  -p 21027:21027/udp \
  -p 8384:8384 \
  \
  -v /infra/syncthing:/var/syncthing \
  \
  -e STGUIADDRESS=0.0.0.0:8384 \
  --hostname=syncthing \
  \
  --name=syncthing \
  syncthing/syncthing:1.27 
