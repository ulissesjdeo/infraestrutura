# Setup
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
mkdir /infra/gitea_BACKUP 2> /dev/null
cd /infra/gitea_BACKUP || exit

# Dump dos dados
docker exec -u 1000 -it -w /tmp gitea bash -c '/usr/local/bin/gitea dump -c /data/gitea/conf/app.ini'

# Path do dump no container
BACKUP_FILE=$(docker exec gitea bash -c "ls -t /tmp/gitea-dump-*.zip | head -1")
FILENAME=$(basename "$BACKUP_FILE")

# Copiando dump para host
docker cp gitea:"$BACKUP_FILE" /infra/gitea_BACKUP

# Abrindo backup
unzip "$FILENAME" -d gitea

# Apagando zip original
rm "$FILENAME"

# Remove backup do XORM pois ele é potencialmente problemático
rm gitea/gitea-db.sql

# Aguardando postgres ficar pronto
until docker exec postgres pg_isready ; do sleep 2 ; done

# pg_dump do gitea
docker exec postgres pg_dump -U postgres gitea > gitea/PGDUMP.sql

# Salvando com timestamp
mv gitea/ "$TIMESTAMP"_gitea/

# Empacotando
tar czf "$TIMESTAMP"_gitea.tar.gz "$TIMESTAMP"_gitea/

# Removendo pasta
rm -r "$TIMESTAMP"_gitea/
