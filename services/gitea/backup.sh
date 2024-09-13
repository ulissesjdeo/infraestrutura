echo "=== INICIANDO BACKUP"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

echo "=== CRIANDO PASTAS"
mkdir -p /BACKUP/gitea 2> /dev/null
cd /BACKUP/gitea || exit

echo "=== FAZENDO DUMP (SEM BANCO/LOGS)"
docker exec -u 1000 -it -w /tmp gitea bash -c '/usr/local/bin/gitea dump --skip-log --skip-db --quiet -c /data/gitea/conf/app.ini'

echo "=== COPIANDO DUMP"
BACKUP_FILE=$(docker exec gitea bash -c "ls -t /tmp/gitea-dump-*.zip | head -1")
FILENAME=$(basename "$BACKUP_FILE")
docker cp gitea:"$BACKUP_FILE" /BACKUP/gitea/

echo "=== PARANDO GITEA"
docker stop gitea

echo "=== DESCOMPACTANDO DUMP"
unzip -q "$FILENAME" -d gitea-dump

until docker exec postgres pg_isready -q; do
    echo "=== AGUARDANDO POSTGRES"; sleep 2
done

echo "=== FAZENDO DUMP DO BANCO"
docker exec postgres pg_dump -U postgres -Fc -d gitea > gitea-dump/gitea-db.dump

echo "=== INICIANDO GITEA"
docker start gitea

echo "=== LIMPANDO E COMPACTANDO"
rm gitea-dump/app.ini
zip -r gitea-dump-"$TIMESTAMP".zip gitea-dump/
rm -rf gitea-dump/ "$FILENAME"
