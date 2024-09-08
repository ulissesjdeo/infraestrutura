# https://hub.docker.com/r/dbeaver/cloudbeaver
# https://github.com/dbeaver/cloudbeaver/wiki/Run-Docker-Container

# Criando diretorio
mkdir /infra/cloudbeaver

# Criando container
docker run \
  --name cloudbeaver \
  -it \
  -d \
  --restart=unless-stopped \
  -p 8080:8978 \
  -v /infra/cloudbeaver\
 dbeaver/cloudbeaver:24.2
