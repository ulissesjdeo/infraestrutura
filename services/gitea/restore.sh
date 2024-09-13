# FIXME: Refactoring

if [ $# -eq 0 ]; then
    echo "Error: No file specified" >&2
    echo "Usage: $0 <FILENAME>" >&2
    exit 1
fi

FILENAME="$1"

if [ ! -f "$FILENAME" ]; then
    echo "Error: File '$FILENAME' not found" >&2
    exit 1
fi

if ! unzip -t "$FILENAME" > /dev/null 2>&1; then
    echo "Error: '$FILENAME' is not a valid ZIP file" >&2
    exit 1
fi

# Parando container
docker stop gitea

# Abrindo backup
unzip -q "$FILENAME"

# Restaurando data
rm -rf /infra/gitea/gitea/*
cp -r gitea-dump/data/* /infra/gitea/gitea/

# Restaurando repositórios
rm -rf /infra/gitea/git/repositories/*
cp -r gitea-dump/repos/* /infra/gitea/git/repositories/

# Aguardando postgres ficar pronto
until docker exec postgres pg_isready -q; do
    echo "PostgreSQL is unavailable - sleeping"
    sleep 2
done

# Restaurando banco
docker exec -it postgres psql -U postgres -c "DROP DATABASE gitea;"
docker exec -it postgres psql -U postgres -c "CREATE DATABASE gitea;"
docker exec -i postgres pg_restore -U postgres -v -d gitea < gitea-dump/gitea-db.dump

# Iniciando gitea
docker start gitea

# Corrigindo permissões
docker exec gitea chown -R git:git /data/

# Gerando hooks
docker exec --user git gitea /usr/local/bin/gitea -c '/data/gitea/conf/app.ini'

# Limpando pasta do backup
rm -rf gitea-dump/
