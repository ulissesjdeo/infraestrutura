docker rm -vf $(docker ps -aq)

docker rmi -f $(docker images -aq)

rm -rf /infra
