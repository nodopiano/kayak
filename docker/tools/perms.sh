#!/usr/bin/env bash
set -e


echo "Setting permissions for the docker container..."
/usr/local/bin/permission_fix || true
chown -R $DOCKER_USER:$DOCKER_GROUP $VOLUME || true
echo "Done."
