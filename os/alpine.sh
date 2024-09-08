# Habilite o repositorio "community"
vi /etc/apk/repositories

# Selecionando melhor mirror
setup-apkrepos -cf

# Atualizando o sistema
apk update && apk upgrade

# Instalando pacotes
apk add git docker docker-cli-compose

# Iniciando docker
service docker start

# Adicionando docker ao startup
rc-update add docker default

# Clone o repositorio "infra" (ou traga ele via pendrive/rede)
git clone ...

# Mude a porta do SSH do sistema para 48022
vi /etc/ssh/sshd_config

# Reinicie o SSH
rc-service sshd restart
