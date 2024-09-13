# Selecionando o melhor mirror de pacotes
setup-apkrepos -cf

# Habilite o repositório "community" https://wiki.alpinelinux.org/wiki/Repositories
vi /etc/apk/repositories

# Atualize o sistema
apk update
apk upgrade

# Instale as dependências
apk add git docker

# Ativando as dependências
rc-update add docker default

# (opcional) Mude a porta do SSH do sistema para 48022
vi /etc/ssh/sshd_config

# (opcional) Remove MOTD
rm /etc/motd

# Reinicie
reboot
