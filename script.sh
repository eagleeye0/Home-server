# Install docker
sudo apt-get update
sudo apt install docker.io -y
# FTP server
sudo apt install vsftpd
sudo systemctl start vsftpd
sudo systemctl enable vsftpd
sudo useradd -m akshat_ftp
sudo passwd akshat_ftp
sudo mkdir /srv/alldata
sudo usermod -d /srv/alldata akshat_ftp
sudo systemctl restart vsftpd.service
# Jellyfin
docker pull jellyfin/jellyfin
mkdir /srv/alldata/jellyfin/config
mkdir /srv/alldata/jellyfin/cache
mkdir /srv/alldata/jellyfin/media
# Torrent server
docker pull linuxserver/deluge
mkdir /srv/alldata/deluge/config
# Image host

docker-compose up
# ssh
sudo apt install openssh-server
sudo ufw enable
sudo ufw allow ssh
