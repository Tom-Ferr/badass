#!/bin/bash

# Get a list of all active container IDs
container_ids=$(docker ps -q)
files=$(ls)

# Loop through each container
for container_id in $container_ids; do
    # Get container details
    container_hostname=$(docker inspect --format='{{ .Config.Hostname}}' $container_id)
    if echo -n "$container_hostname" | grep -q "\b$files\b"; then
       docker exec -i $container_id sh -s < $container_hostname
    fi
done