# https://docs.portainer.io/start/install-ce/server/docker/linux

mkdir /infra/portainer

docker run \
  -d \
  --restart=always \
  -p 9443:9443 \
  -p 9000:9000 \
  -p 8000:8000 \
  \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /infra/portainer:/data \
  \
  --name portainer \
  portainer/portainer-ce:2.21.0
