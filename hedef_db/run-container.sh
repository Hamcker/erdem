#!/bin/bash

# Run the Docker container from the image "erdemdb:v1" on the network "erdemnet"
docker run -d --name erdem_db_container --network erdemnet -p 3306:3306 erdemdb:v1

# ...existing code...
