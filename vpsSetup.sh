#!/bin/bash
user=
pass=
port=

apt install -y screen software-properties-common wget bzip2 make lbzip2  build-essential
wget "https://raw.githubusercontent.com/kanzetu/vpsSetup/master/aria2.conf" -O aria2.conf
mv aria2.conf /etc/aria2.conf
touch /etc/aria2.session
mkdir /home/Download


wget "https://downloads.rclone.org/rclone-current-linux-amd64.deb" 
dpkg -i "rclone-current-linux-amd64.deb"
rm rclone-current-linux-amd64.deb
curl -s "https://raw.githubusercontent.com/kanzetu/vpsSetup/master/complete.sh" > /opt/complete.sh
chmod 777 /opt/complete.sh

wget "https://github.com/q3aql/aria2-static-builds/releases/download/v1.34.0/aria2-1.34.0-linux-gnu-64bit-build1.tar.bz2"
tar xf "aria2-1.34.0-linux-gnu-64bit-build1.tar.bz2"
cd aria2-1.34.0-linux-gnu-64bit-build1
make install 
cd ..
rm -r aria2-1.34.0-linux-gnu-64bit-build1 aria2-1.34.0-linux-gnu-64bit-build1.tar.bz2
screen -Sdm aria2  aria2c --conf-path /etc/aria2.conf

curl -sL https://deb.nodesource.com/setup_10.x |  bash -
apt install -y nodejs

wget "https://github.com/porjo/youtubeuploader/releases/download/18.15/youtubeuploader_linux_amd64.tar.gz"
tar xf youtubeuploader_linux_amd64.tar.gz
mv youtubeuploader_linux_amd64 /usr/bin/youtubeuploader
chmod 777 /usr/bin/youtubeuploader
rm youtubeuploader_linux_amd64.tar.gz

curl https://i.jpillora.com/cloud-torrent! | bash
mkdir /home/Download/start
mkdir /home/Download/upload
curl -s "https://raw.githubusercontent.com/kanzetu/vpsSetup/master/auto.sh" > /home/Download/auto.sh
chmod 777 /home/Download/auto.sh
screen -Sdm auto bash -c "/home/Download/auto.sh"
screen -Sdm cloud bash -c "cd /home/Download &&  cloud-torrent -p $port -a $user:$pass" 
curl -s "https://raw.githubusercontent.com/kanzetu/vpsSetup/master/upload.sh" >  /home/Download/upload/upload.sh
chmod 777 /home/Download/upload/upload.sh

npm i cloudcmd -g
screen -Sdm cmd bash -c "cloudcmd -a -u $user -p $pass --port 8001"
