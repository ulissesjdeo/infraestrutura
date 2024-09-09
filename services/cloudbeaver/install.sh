# https://hub.docker.com/r/dbeaver/cloudbeaver

mkdir -p /infra/cloudbeaver

docker run \
  -itd \
  --restart unless-stopped \
  -p 8978:8978 \
  \
  -v /infra/cloudbeaver\
  \
  --name cloudbeaver \
  dbeaver/cloudbeaver:24.2
