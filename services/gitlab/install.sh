# https://docs.gitlab.com/ee/install/docker/installation.html
# https://docs.gitlab.com/ee/install/docker/configuration.html
# https://docs.gitlab.com/ee/install/docker/backup_restore.html  # TODO: Implementar script
# https://docs.gitlab.com/ee/install/docker/upgrade.html  # TODO: Implementar script
# https://hub.docker.com/r/gitlab/gitlab-ce/tags/

# Definindo diretorio dos dados
export GITLAB=/infra/gitlab

# Criando diretorio
mkdir $GITLAB

# Rodando container
docker run --detach \
  --hostname gitlab.example.com \
  --env GITLAB_OMNIBUS_CONFIG="external_url 'http://192.168.15.14'; gitlab_rails['lfs_enabled'] = true;" \
  --publish 443:443 --publish 80:80 --publish 22:22 \
  --name gitlab \
  --restart always \
  --volume $GITLAB/config:/etc/gitlab \
  --volume $GITLAB/logs:/var/log/gitlab \
  --volume $GITLAB/data:/var/opt/gitlab \
  --shm-size 256m \
  gitlab/gitlab-ce:17.1.6-ce.0

# Ver logs para acompanhar instalacao 
#docker logs -f gitlab

# Ver senha para login via root
cat $GITLAB/config/initial_root_password
