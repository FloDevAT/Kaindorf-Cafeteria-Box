#!/bin/bash

# Build the Image
docker build -t kaindorf-cafeteria-server .

# Create a Custom Bridge Network with a Specific Subnet
docker network rm kaindorf-network
docker network create --driver bridge --subnet 192.168.100.0/24 kaindorf-network

# Stop and remove any existing container
docker stop kaindorf-cafeteria
docker rm kaindorf-cafeteria

# Run the container with a static IP on the custom network
docker run -it --privileged --name kaindorf-cafeteria --network kaindorf-network --ip 192.168.100.10 kaindorf-cafeteria-server