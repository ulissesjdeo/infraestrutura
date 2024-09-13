# Updates e pacotes
apt-get -y update
apt-get -y dist-upgrade
apt-get -y intall openssh-server git unzip zip

# Habilitando SSH
systemctl enable --now ssh

# Docker
# https://docs.docker.com/engine/install/debian/#prerequisites
