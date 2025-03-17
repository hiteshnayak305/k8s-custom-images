#!/bin/sh

# Wait for the BuildKit daemon to be ready
while ! nc -z "$BUILDKIT_HOST" "$BUILDKIT_PORT"; do
    echo "Waiting for buildkit on $BUILDKIT_HOST:$BUILDKIT_PORT..."
    sleep 5s
done
# Create a new BuildKit instance
docker buildx create --name remote --driver remote --node remote-0 --use "tcp://$BUILDKIT_HOST:$BUILDKIT_PORT"
# Inspect the BuildKit instance
docker buildx inspect remote

# Run the command
exec "$@"
