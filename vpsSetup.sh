#!/bin/bash

function printTitle(){
	termwidth="$(tput cols)"
	for ((i = 0 ; i < $termwidth ; i++)); do
		printf "━"
	done
	padding="$(printf '%0.1s' " "{1..500})"
	printf '%*.*s %s %*.*s\n' 0 "$(((termwidth-2-${#1})/2))" "$padding" "$1" 0 "$(((termwidth-1-${#1})/2))" "$padding"
	for ((i = 0 ; i < $termwidth ; i++)); do
                printf "━"
        done
}

printTitle "This is a VPS Setup Script (Debian 9 recommanded)"

tee <<-EOF

	☒	DO NOT run on your MAC


EOF

if [[ `read -p 'Do you READY for the script?(y/n):'` == 'n' ]]; then
	exit
fi


clear

printTitle "INSTALLATION		PART1"
tee <<- EOF

		The thing below will installed later
		1.	rclone
		2.	nodejs
		3.	cloudcmd
		4.	aria2

EOF

apt install aria2 screen curl software-properties-common wget
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
apt install nodejs






