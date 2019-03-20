#!/bin/sh
/tools/wp core install --url="$SITE_URL" --title="$SITE_NAME" --admin_user="$WP_USER" --admin_password="$WP_PASSWORD" --admin_email="$WP_EMAIL"
