# wordpress-docker
a simple docker configuration for wordpress

## how to use wp cli

WP-CLI is a set of command-line tools for managing WordPress installations. You can update plugins, configure multisite installs and much more, without using a web browser.
To use wp-cli to install wordpress after the container has been built just type:­­
```
docker-compose exec np-wp wp core install --url="site.dev" --title="sitename" --admin_user="admin" --admin_password="password" --admin_email="youremail@example.com"
```

every WP-CLI command can be executed with 
```
docker-compose exec np-wp wp
```

