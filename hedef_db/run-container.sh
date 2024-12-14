#!/bin/bash

# Stop and remove all containers of the image "erdemdb:v1"
docker ps -aq --filter "ancestor=erdemdb:v1" | xargs -r docker stop | xargs -r docker rm

# Check if the network "erdemnet" exists, and create it if it does not
if ! docker network ls | grep -q "erdemnet"; then
  docker network create erdemnet
fi

# Run the Docker container from the image "erdemdb:v1" on the network "erdemnet"
docker run -d --name erdem_db_container --network erdemnet -p 3306:3306 \
  -e MYSQL_ROOT_PASSWORD=rootpassword \
  -e MYSQL_DATABASE=TestDB \
  -e MYSQL_USER=myuser \
  -e MYSQL_PASSWORD=mypassword \
  erdemdb:v1

# Ensure the environment variables are correctly set in the Bash script
export MYSQL_ROOT_PASSWORD=rootpassword
export MYSQL_DATABASE=TestDB
export MYSQL_USER=myuser
export MYSQL_PASSWORD=mypassword

# ...existing code...
