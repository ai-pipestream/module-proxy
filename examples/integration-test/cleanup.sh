#!/bin/bash

echo "Cleaning up module-proxy integration test resources..."

# Stop and remove containers
echo "Stopping containers..."
docker-compose down

# Remove volumes (optional, ask user)
read -p "Remove volumes? (y/N) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Removing volumes..."
    docker-compose down -v
fi

# Remove network if it exists
echo "Removing network..."
docker network rm module-proxy-integration-test 2>/dev/null || true

echo "Cleanup complete!"
