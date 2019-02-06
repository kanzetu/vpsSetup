youtubeuploader -privacy private -description "" -filename "$2/$1" -title "${1%.*}"  -secrets /opt/client_secrets.json -cache /opt/request.token
rm "$2/$1"
