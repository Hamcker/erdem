# Stop and remove all containers of the image "erdemdb:v1"
docker ps -aq --filter "ancestor=erdemdb:v1" | ForEach-Object { docker stop $_; docker rm $_ }

# Check if the network "erdemnet" exists, and create it if it does not
if (-not (docker network ls | Select-String -Pattern "erdemnet")) {
  docker network create erdemnet
}

# Run the Docker container from the image "erdemdb:v1" on the network "erdemnet"
docker run -d --name erdem_db_container --network erdemnet -p 3306:3306 `
  -e MYSQL_ROOT_PASSWORD=rootpassword `
  -e MYSQL_DATABASE=TestDB `
  -e MYSQL_USER=myuser `
  -e MYSQL_PASSWORD=mypassword `
  erdemdb:v1

# ...existing code...
