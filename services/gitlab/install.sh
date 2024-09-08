# https://docs.gitlab.com/ee/install/docker/installation.html

# https://docs.gitlab.com/ee/install/docker/backup_restore.html  # TODO: Implementar script
# https://docs.gitlab.com/ee/install/docker/upgrade.html  # TODO: Implementar script

export GITLAB=/infra/gitlab

mkdir -p $GITLAB

docker run \
  -d \
  --restart unless-stopped \
  -p 443:443 \
  -p 80:80 \
  -p 22:22 \
  \
  --volume $GITLAB/config:/etc/gitlab \
  --volume $GITLAB/logs:/var/log/gitlab \
  --volume $GITLAB/data:/var/opt/gitlab \
  \
  --env GITLAB_OMNIBUS_CONFIG="external_url 'http://192.168.15.14'; gitlab_rails['lfs_enabled'] = true;" \
  --hostname gitlab.example.com \
  --shm-size 256m \
  \
  --name gitlab \
  gitlab/gitlab-ce:17.1.6-ce.0

# Ver logs
#docker logs -f gitlab

# Ver senha do root
#cat $GITLAB/config/initial_root_password
