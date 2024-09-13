# https://docs.portainer.io/start/install-ce/server/docker/linux

mkdir -p /infra/portainer

docker run \
  -d \
  --restart unless-stopped \
  \
  --network nginx \
  --ip 172.19.0.3 \
  \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /infra/portainer:/data \
  \
  --name portainer \
  portainer/portainer-ce:2.21.1
