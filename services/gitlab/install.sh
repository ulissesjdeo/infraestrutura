# https://docs.gitlab.com/ee/install/docker/installation.html

# https://docs.gitlab.com/ee/install/docker/backup_restore.html  # TODO: Implementar script
# https://docs.gitlab.com/ee/install/docker/upgrade.html  # TODO: Implementar script

mkdir -p /infra/gitlab

docker run \
  -d \
  --restart unless-stopped \
  -p 20443:443 \
  -p 20080:80 \
  -p 20022:22 \
  \
  --volume /infra/gitlab/config:/etc/gitlab \
  --volume /infra/gitlab/logs:/var/log/gitlab \
  --volume /infra/gitlab/data:/var/opt/gitlab \
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
#cat /infra/gitlab/config/initial_root_password
