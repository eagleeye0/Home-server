# Install docker
sudo apt-get update
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-cache policy docker-ce
sudo apt install docker-ce -y
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
# FTP server
sudo apt install vsftpd
sudo systemctl start vsftpd
sudo systemctl enable vsftpd
sudo useradd -m akshat_ftp
sudo passwd akshat_ftp
# save password here for user
sudo mkdir /srv/alldata
sudo usermod -d /srv/alldata akshat_ftp
sudo chmod a+w /srv/alldata
sudo su
echo "enable_write" >> /etc/vsftpd.conf
su ubuntu
sudo systemctl restart vsftpd.service
# Jellyfin
sudo docker pull jellyfin/jellyfin
mkdir /srv/alldata/jellyfin
mkdir /srv/alldata/jellyfin/config
mkdir /srv/alldata/jellyfin/cache
mkdir /srv/alldata/jellyfin/media
# Torrent server
sudo docker pull linuxserver/deluge
mkdir /srv/alldata/deluge
mkdir /srv/alldata/deluge/config
# Image host

docker-compose up
# ssh
sudo apt install openssh-server
sudo ufw enable
sudo ufw allow ssh
