# Update
apt-get -y update
apt-get -y dist-upgrade

# Instalar dependências
apt-get -y intall openssh-server git unzip zip

# (opcional) Mude a porta do SSH do sistema para 48022
nano /etc/ssh/sshd_config

# (opcional) Remove mensagem de login
touch .hushlogin

# Iniciando SSH
systemctl enable --now ssh

# Siga as instruções de instalação do Docker no Debian
# https://docs.docker.com/engine/install/debian/#prerequisites
