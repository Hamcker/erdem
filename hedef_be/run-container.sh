#!/bin/bash

# Stop and remove all containers of the image "hedef_be:v1"
docker ps -aq --filter "ancestor=hedef_be:v1" | xargs -r docker stop | xargs -r docker rm

# Run the Docker container for hedef_be and connect it to the MariaDB container
docker run -d --name hedef_be_container --network erdemnet -p 80:3000 \
  -e DB_HOST=erdem_db_container \
  -e DB_USER=root \
  -e DB_PASSWORD=rootpassword \
  -e DB_NAME=TestDB \
  hedef_be:v1
