# https://github.com/swarmpit/swarmpit

docker swarm init

docker run \
  --rm \
  -it \
  \
  --volume /var/run/docker.sock:/var/run/docker.sock \
  \
  --name swarmpit-installer \
  swarmpit/install:1.9
