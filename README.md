# Kayak
Kayak is a wrapper around docker-compose, based on Vessel. By default, the following containers are started: Apache/php7.0, MariaDB, PhpMyAdmin. The /wp_html directory is the web root which is mapped to the apache/php container.
A Dockerfile is included for apache2/wordpress (Dockerfile). This adds a few extra things to the wordpress image, such as wp-cli.
You can start the containers with:
```
kayak start
```

## How to install WordPress
Before installing WordPress you need to create a .env file, kayak do it for you with 
```
kayak init
```
just edit the .env file and then install WordPress with:
```
kayak install
```

## WP-Cli

WP-CLI is a set of command-line tools for managing WordPress installations. You can update plugins, configure multisite installs and much more, without using a web browser.
To use wp-cli just type:­
```
kayak wp  
```

## Database dump
you can dump the database anytime you want with a line: 
```
kayak dump > dump.sql
```

## Credits
Kayak is heavily based on [Chris Fidao](https://github.com/fideloper) [Vessel](https://github.com/shipping-docker/vessel)

