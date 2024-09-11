# Remove mensagem de login
touch .hushlogin

# Update
apt-get update
apt-get dist-upgrade

# Seguir as instruções de instalação oficiais
# https://docs.docker.com/engine/install/debian/#prerequisites

# Mude a porta do SSH do sistema para 48022
nano /etc/ssh/sshd_config
systemctl restart ssh
