#!/bin/bash
set -e  # exit immediately if a command fails

echo "Pulling latest code..."
git pull

echo "Logging into Azure Container Registry..."
az acr login --name aicargomation

echo "Pulling latest Docker images..."
docker compose pull

echo "Restarting containers..."
docker compose up -d

echo "Deployment complete!"

docker system prune -a
echo "Pruning images"
