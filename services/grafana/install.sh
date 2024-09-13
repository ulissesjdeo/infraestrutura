# https://grafana.com/docs/grafana/latest/setup-grafana/installation/docker/
# https://grafana.com/grafana/download?edition=oss&platform=docker

mkdir -p /infra/grafana

docker run \
  -d \
  -p 30000:3000 \
  --volume "/infra/grafana:/var/lib/grafana" \
  \
  --user "$(id -u)" \
  \
  --name=grafana \
  grafana/grafana-oss:11.2.0-ubuntu
