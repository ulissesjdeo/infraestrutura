echo "=== INICIANDO BACKUP"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

echo "=== CRIANDO PASTAS"
mkdir -p /BACKUP/papermc 2> /dev/null
cd /BACKUP/papermc || exit

echo "=== PARANDO PAPERMC"
docker stop papermc 1> /dev/null

echo "=== LIMPANDO ARQUIVOS"
rm -rf /infra/papermc/banned-*
rm -rf /infra/papermc/bukkit.yml
rm -rf /infra/papermc/cache/
rm -rf /infra/papermc/commands.yml
rm -rf /infra/papermc/help.yml
rm -rf /infra/papermc/libraries/
rm -rf /infra/papermc/logs/
rm -rf /infra/papermc/permissions.yml
rm -rf /infra/papermc/spigot.yml
rm -rf /infra/papermc/version_history.json

echo "=== COMPACTANDO E SALVANDO"
tar czf papermc-dump-"$TIMESTAMP".tar.gz /infra/papermc/

echo "=== INICIANDO PAPERMC"
docker start papermc 1> /dev/null
