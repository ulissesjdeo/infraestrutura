# Escolhendo mirror
setup-apkrepos -cf

# Habilitar "community" https://wiki.alpinelinux.org/wiki/Repositories
vi /etc/apk/repositories

# Updates e pacotes
apk update
apk upgrade
apk add git docker

# Habilitando Docker
service docker start
rc-update add docker default
