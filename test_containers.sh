#!/bin/bash

# Script to test Docker containers

echo "Starting Docker containers..."
docker-compose up -d

# Wait for containers to initialize
sleep 5

# Test Backend API (Replace port and endpoint as needed)
echo "Testing Backend..."
curl --fail http://localhost:3000 || { echo "Backend test failed"; exit 1; }
echo "Backend is up and running."

# Test Frontend (Replace port if modified in docker-compose)
echo "Testing Frontend..."
curl --fail http://localhost:3001 || { echo "Frontend test failed"; exit 1; }
echo "Frontend is up and running."

# Test Database Connection (using mongo client for validation)
echo "Testing Database..."
docker exec $(docker-compose ps -q db) mongo --eval "db.runCommand({ ping: 1 })" || { echo "Database test failed"; exit 1; }
echo "Database is up and running."

echo "All containers are running correctly."

# Optionally, stop the containers
# echo "Stopping Docker containers..."
# docker-compose down