#!/bin/bash
user=
pass=
port=

apt install -y aria2 screen software-properties-common wget
wget "https://raw.githubusercontent.com/kanzetu/vpsSetup/master/aria2.conf" -O aria2.conf
cp aria2.conf /etc/aria2.conf
touch /etc/aria2.session
mkdir /home/Download


wget "https://downloads.rclone.org/rclone-current-linux-amd64.deb" 
dpkg -i "rclone-current-linux-amd64.deb"
rm rclone-current-linux-amd64.deb


wget "https://github.com/q3aql/aria2-static-builds/releases/download/v1.34.0/aria2-1.34.0-linux-gnu-64bit-build1.tar.bz2"
tar xf "aria2-1.34.0-linux-gnu-64bit-build1.tar.bz2"
cd aria2-1.34.0-linux-gnu-64bit-build1
make install 
cd ..
rm -r aria2-1.34.0-linux-gnu-64bit-build1 aria2-1.34.0-linux-gnu-64bit-build1.tar.bz2

curl -sL https://deb.nodesource.com/setup_10.x | sudo bash -
apt install -y nodejs
screen -Sdm sudo aria2c --conf-path /etc/aria2.conf

wget "https://github.com/porjo/youtubeuploader/releases/download/18.15/youtubeuploader_linux_amd64.tar.gz"
mv youtubeuploader_linux_amd64 /usr/bin/youtubeuploader
chmod 777 /usr/bin/youtubeuploader

curl https://i.jpillora.com/cloud-torrent! | bash
mkdir /home/Download/start
mkdir /home/Download/upload
screen -Sdm "cd /home/Download && cloud-torrent -p $port -a $user:$pass" 
