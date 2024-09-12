#https://github.com/Stirling-Tools/Stirling-PDF

docker run \
  -d \
  --restart unless-stopped \
  -p 48088:8080 \
  \
  -e LANGS=pt_BR \
  -e DOCKER_ENABLE_SECURITY=false \
  -e INSTALL_BOOK_AND_ADVANCED_HTML_OPS=false \
  \
  --name stirlingpdf \
  frooodle/s-pdf:0.28.3-fat
