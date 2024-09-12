# https://hub.docker.com/_/postgres

# https://www.linkedin.com/pulse/how-speed-up-pgdump-when-dumping-large-postgres-nikolay-samokhvalov/
# https://stackoverflow.com/questions/2094963/postgresql-improving-pg-dump-pg-restore-performance
# https://stackoverflow.com/questions/5529603/best-method-for-postgresql-incremental-backup

mkdir -p /infra/postgres

docker network create --subnet=172.18.0.0/16 postgres

docker run \
  -itd \
  --restart unless-stopped \
  \
  --network postgres \
  --ip 172.18.0.1 \
  \
  -v /infra/postgres:/var/lib/postgresql/data \
  \
  -e PGDATA=/var/lib/postgresql/data/pgdata \
  -e POSTGRES_PASSWORD=mysecretpassword \
  \
  --name postgres \
  postgres:16.4-bookworm
