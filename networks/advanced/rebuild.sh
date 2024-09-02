#!/bin/bash

set -e

# Define the Docker image and container names
IMAGE_NAME="nat-config"
CONTAINERS=("router" "public_node" "isp" "device1")
NETWORKS=("natconfig_home_net" "natconfig_isp_net" "natconfig_public_net")

# Function to remove Docker containers, images, and networks
cleanup() {
  echo "Stopping and removing Docker containers..."
  for container in "${CONTAINERS[@]}"; do
    docker stop "$container" || true
    docker rm "$container" || true
  done

  echo "Removing Docker image..."
  docker rmi "$IMAGE_NAME" || true

  echo "Removing Docker networks..."
  docker network prune
  for network in "${NETWORKS[@]}"; do
    docker network rm "$network" || true
  done
}

# Function to build Docker image and start Docker Compose
build_and_run() {
  echo "Building Docker image..."
  docker build -t "$IMAGE_NAME" .

  echo "Building Docker Compose images..."
  docker compose build

  echo "Starting Docker Compose..."
  docker compose up --build
}

# Main script execution
echo "Starting rebuild process..."

# Remove existing containers, images, and networks
cleanup

# Build image and start Docker Compose setup
build_and_run

echo "Rebuild process completed."
