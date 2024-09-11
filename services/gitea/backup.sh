# Parando script se algo der errado
set -euo pipefail

# Setup
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
mkdir -p /BACKUP/gitea 2> /dev/null
cd /BACKUP/gitea || exit

# Dump dos dados
docker exec -u 1000 -it -w /tmp gitea bash -c '/usr/local/bin/gitea dump -c /data/gitea/conf/app.ini'

# Path do dump no container
BACKUP_FILE=$(docker exec gitea bash -c "ls -t /tmp/gitea-dump-*.zip | head -1")
FILENAME=$(basename "$BACKUP_FILE")

# Copiando dump para host
docker cp gitea:"$BACKUP_FILE" /BACKUP/gitea/

# Abrindo backup
unzip -q "$FILENAME" -d gitea-dump 1> /dev/null

# Parando Gitea
docker stop gitea

# Aguardando postgres ficar pronto
until docker exec "$POSTGRES_CONTAINER" pg_isready -q; do
    echo "PostgreSQL is unavailable - sleeping"
    sleep 2
done

# pg_dump do gitea
rm gitea-dump/gitea-db.sql
docker exec postgres pg_dump -U postgres -Fc -d gitea > gitea-dump/gitea-db.dump

# Iniciando Gitea
docker start gitea

# Limpa arquivos desnecessários
rm gitea-dump/app.ini

# Compacta
zip -r gitea-dump-"$TIMESTAMP".zip gitea-dump/

# Limpa
rm -rf gitea-dump/ "$FILENAME"
