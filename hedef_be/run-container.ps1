# Stop all running containers of the image
docker ps -aq --filter "ancestor=hedef_be:v1" | ForEach-Object { docker stop $_ }

# Check if the network exists, and create it if it does not
if (-not (docker network ls | Select-String -Pattern "erdemnet")) {
  docker network create erdemnet
}

# Run the Docker container on the network with environment variables
docker run -d --name hedef_be_container --network erdemnet -p 80:3000 `
  -e DB_HOST=erdem_db_container `
  -e DB_USER=root `
  -e DB_PASSWORD=rootpassword `
  -e DB_NAME=TestDB `
  hedef_be:v1
