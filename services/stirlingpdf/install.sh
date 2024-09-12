#https://github.com/Stirling-Tools/Stirling-PDF

mkdir -p /infra/stirlingpdf/data /infra/stirlingpdf/configs /infra/stirlingpdf/logs

docker run \
  -d \
  --restart unless-stopped \
  -p 48088:8080 \
  \
  -v /infra/stirlingpdf/data:/usr/share/tessdata \
  -v /infra/stirlingpdf/configs:/configs \
  -v /infra/stirlingpdf/logs:/logs \
  \
  -e LANGS=en_US \
  -e DOCKER_ENABLE_SECURITY=false \
  -e INSTALL_BOOK_AND_ADVANCED_HTML_OPS=false \
  \
  --name stirlingpdf \
  frooodle/s-pdf:0.28.3-fat
