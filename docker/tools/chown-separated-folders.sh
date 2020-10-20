#!/bin/bash
# https://github.com/docker-library/wordpress/issues/194 for reference

# Sed prevents the original entrypoint to get stuck on "exec", preventing
# our custom entrypoint to run.
sed -i -e 's/^exec "$@"/#exec "$@"/g' /usr/local/bin/docker-entrypoint.sh
source docker-entrypoint.sh

echo "Fixing permissions in /var/www/html..."
chown -R www-data:www-data /var/www/html

exec "$@"
