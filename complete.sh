#!/bin/bash
sleep 2s
name="`echo \"$3\"|cut -d'/' -f4`"
rclone copy -vvv --config /opt/rclone.conf --transfers 10 /home/Download/"$name" hku:/Unified/FromAutoScript/"`date +%Y-%m-%d`"/"$name" >> /opt/log
if [ $? -eq 0 ]; then
	echo "[`date +%Y-%m-%d-%H-%M-%S`] Complete upload : $name" >> /opt/log
	rm -r "/home/Download/$name"
	echo -e "[RCLONE] [`date +%Y-%m-%d-%H-%M-%S`]  Complete COPY $name" >> /opt/rclone.log
fi
