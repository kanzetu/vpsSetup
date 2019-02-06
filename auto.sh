uploadDir="/home/Download/upload"
sourceDir="/home/Download/start"
while : ; do
if [[ "`ls $sourceDir`" != "" ]]; then
	file="`ls $sourceDir |head -n1`"
	mv "$sourceDir"/"$file" "$uploadDir/$file"
	nohup $uploadDir/upload.sh "$file" "$uploadDir" &
fi
sleep 5s
done
