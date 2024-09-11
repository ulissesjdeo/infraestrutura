docker rm -vf "$(docker ps -aq)" 2> /dev/null
docker rmi -f "$(docker images -aq)" 2> /dev/null
rm -rf /infra
