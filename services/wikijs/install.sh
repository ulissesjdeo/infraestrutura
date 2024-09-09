docker exec -it postgres psql -U postgres -c "CREATE DATABASE wikijs;"

docker run \
  -d \
  --restart unless-stopped \
  -p 3080:3000 \
  \
  --link postgres:db \
  -e "DB_TYPE=postgres" \
  -e "DB_HOST=db" \
  -e "DB_PORT=5432" \
  -e "DB_USER=postgres" \
  -e "DB_PASS=mysecretpassword" \
  -e "DB_NAME=wikijs" \
  \
  --name wikijs \
  requarks/wiki:2.5.303
