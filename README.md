# wordpress-docker
This project is based on docker-compose. By default, the following containers are started: Apache, MariaDB, PhpMyAdmin. The /wp_html directory is the web root which is mapped to the nginx container.
A Dockerfile is included for apache2/wordpress (Dockerfile). This adds a few extra things to the wordpress image, such as wp-cli.
You can start the containers with:
```
docker-composer up -d
```

## how to use wp cli

WP-CLI is a set of command-line tools for managing WordPress installations. You can update plugins, configure multisite installs and much more, without using a web browser.
You can easily access the WordPress/Apache container with docker-compose exec. Here's a simple alias to add to your ~/.bash_profile:
```
alias dwp='docker-compose exec np-wp wp'
```
This alias lets you run wpcli into the WordPress container.

To use wp-cli to install wordpress after the container has been built just type (using the alias above):­­
```
dwp core install --url="site.dev" --title="sitename" --admin_user="admin" --admin_password="password" --admin_email="youremail@example.com"
```

## notes
We use a nifty hack in the Dockerfile to set file permissions. We force the the www-data user to a known uid (1001). Feel free to suggest a better option, or set your uid in the dockerfile before starting the containers.  
