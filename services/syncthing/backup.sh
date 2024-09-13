echo "=== INICIANDO BACKUP"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
FILENAME=syncthing-dump-"$TIMESTAMP.tar"

echo "=== CRIANDO PASTAS"
mkdir -p /BACKUP/syncthing 2> /dev/null
cd /BACKUP/syncthing || exit

echo "=== PARANDO SYNCTHING"
docker stop syncthing 1> /dev/null

echo "=== EMPACOTANDO"
tar cf "$FILENAME" /infra/syncthing/config/

echo "=== COMPACTANDO"
xz -9 "$FILENAME"

echo "=== INICIANDO SYNCTHING"
docker start syncthing 1> /dev/null
