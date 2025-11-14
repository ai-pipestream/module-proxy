#!/bin/bash

echo "Cleaning up module-proxy integration test resources..."

# Stop and remove containers
echo "Stopping containers..."
read -p "Remove volumes? (y/N) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Stopping containers and removing volumes..."
    docker-compose down -v
else
    echo "Stopping containers..."
    docker-compose down
fi

# Remove network if it exists
echo "Removing network..."
docker network rm module-proxy-integration-test 2>/dev/null || true

echo "Cleanup complete!"
