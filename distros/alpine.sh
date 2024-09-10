# Faça a instalação do Alpine Standard
setup-alpine

# Habilite o repositório "community"
vi /etc/apk/repositories

# Selecione o melhor mirror
setup-apkrepos -cf

# Atualizando o sistema
apk update
apk upgrade

# Instale distros pacotes
apk add git docker

# Inicie o docker
service docker start

# Adicione o docker ao startup
rc-update add docker default

# Mude a porta do SSH do sistema para 48022
vi /etc/ssh/sshd_config

# Reinicie o SSH
rc-service sshd restart

# Limpa MOTD
rm /etc/motd
