# https://docs.portainer.io/start/install-ce/server/docker/linux

# Criando diretorio
mkdir /infra/portainer

# Criando container
docker run \
  -d \
  -p 8000:8000 \
  -p 9000:9000 \
  -p 9443:9443 \
  --name portainer \
  --restart=always \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /infra/portainer:/data \
  portainer/portainer-ce:2.21.0
