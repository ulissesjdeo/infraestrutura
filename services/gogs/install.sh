# https://hub.docker.com/r/gogs/gogs

mkdir -p /infra/gogs

docker run \
  -itd \
  --restart unless-stopped \
  -p 10880:3000 \
  -p 10022:22 \
  \
  -v /infra/gogs:/data \
  \
  --name=gogs \
  gogs/gogs:latest
