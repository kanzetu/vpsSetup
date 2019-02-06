youtubeuploader -privacy private -description "" -filename "$2/$1" -title "${1%.*}"  -secrets ~/.client_secrets.json
rm "$2/$1"
