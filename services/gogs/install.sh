# https://hub.docker.com/r/gogs/gogs

# Criando diretorio
mkdir /infra/gogs

# Criando container
docker run \
  -d \
  -it \
  --name=gogs \
  --restart=unless-stopped \
  -p 10022:22 \
  -p 10880:3000 \
  -v /infra/gogs:/data \
  gogs/gogs:latest 
