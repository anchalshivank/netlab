#!/bin/bash

set -e

# Define the Docker image and container names
IMAGE_NAME="nat-config"
CONTAINERS=("router" "public_node" "isp" "device1")

# Function to remove Docker containers and images
cleanup() {
  echo "Stopping and removing Docker containers..."
  for container in "${CONTAINERS[@]}"; do
    docker stop "$container" || true
    docker rm "$container" || true
  done

  echo "Removing Docker image..."
  docker rmi "$IMAGE_NAME" || true
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

# Remove existing containers and images
cleanup

# Build image and start Docker Compose setup
build_and_run

echo "Rebuild process completed."
