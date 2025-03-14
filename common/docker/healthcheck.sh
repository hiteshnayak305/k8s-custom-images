#!/bin/sh

# get buildkit status
docker buildx inspect remote | grep -q "running"

# check if buildkit is running
if [ $? -ne 0 ]; then
    echo "BuildKit is not running"
    exit 1
else
    echo "BuildKit is running"
    exit 0
fi
