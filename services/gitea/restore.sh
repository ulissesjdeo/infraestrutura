if [ $# -eq 0 ]; then
    echo "Error: No file specified" >&2
    echo "Usage: $0 <filename>" >&2
    exit 1
fi

filename="$1"

if [ ! -f "$filename" ]; then
    echo "Error: File '$filename' not found" >&2
    exit 1
fi

if ! unzip -t "$filename" > /dev/null 2>&1; then
    echo "Error: '$filename' is not a valid ZIP file" >&2
    exit 1
fi

# Preparando arquivos
docker cp "$1" gitea:dump.zip
docker exec gitea sh -c "yes A | unzip dump.zip"
docker exec gitea rm dump.zip
docker exec gitea cp -r $(docker exec gitea ls | grep gitea) /DUMP

# Restaurando banco
docker stop gitea
until docker exec postgres pg_isready ; do sleep 2 ; done
docker exec -it postgres psql -U postgres -c "DROP DATABASE gitea;"
docker exec -it postgres psql -U postgres -c "CREATE DATABASE gitea;"
docker cp gitea:/DUMP/PGDUMP.sql /PGDUMP.sql
docker cp /PGDUMP.sql postgres:/PGDUMP.sql
docker exec -i postgres psql -U postgres -v -d gitea -f /PGDUMP.sql
docker exec postgres rm /PGDUMP.sql
docker start gitea

# Restaurando data
docker exec gitea rm -rf /data/gitea/
docker exec gitea cp -r /DUMP/data/ /data/gitea/

# Restaurando repositórios
docker exec gitea rm -rf /data/git/repositories/
docker exec gitea cp -r /DUMP/repos/ /data/git/repositories/

# Corrigindo permissões
docker exec gitea chown -R git:git /data/

# Gerando hooks
docker exec gitea --user git /usr/local/bin/gitea -c '/data/gitea/conf/app.ini'
