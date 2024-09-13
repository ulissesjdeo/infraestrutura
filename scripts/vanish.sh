# Proteção
if [ "$1" != "--confirm" ]; then
    echo "Error: Please pass --confirm to run this script."
    exit 1
fi

# Remove containers e volumes
# shellcheck disable=SC2046
docker rm -vf $(docker ps -a -q) 2> /dev/null

# Remove imagens
# shellcheck disable=SC2046
docker image remove -f $(docker images -a -q) 2> /dev/null

# Apaga as redes Docker
docker network prune -f

# Apaga infraestrutura
rm -rf /infra
