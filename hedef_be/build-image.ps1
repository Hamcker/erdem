# Stop and remove all containers of the image "hedef_be:v1"
docker ps -aq --filter "ancestor=hedef_be:v1" | ForEach-Object { docker stop $_; docker rm $_ }

# Build the new image
docker build -t hedef_be:v1 .
