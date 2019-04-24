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

## Wordpress URL and Ports

Kayak binds to port 80 and 3306 on your machine, so you can simply go to http://localhost in your browser. Please make sure you don't have other services running under those ports.

## WP-Cli

WP-CLI is a set of command-line tools for managing WordPress installations. You can update plugins, configure multisite installs and much more, without using a web browser.
To use wp-cli just type:­
```
kayak wp  
```

## Wordmove

Kayak comes with Wordmove available in a separate container. In this way, you do not need to install Ruby nor Wordmove on your local machine.

**Attention:** in order to be able to use Wordmove with Kayak, you **do need** to:

1. Specify the `MOVEFILE_PATH` variable inside your `.env` file. It should point to the *directory* in which your `movefile.yml` file is present.

2. Start creating your movefile from `movefile.example.yml`, as it comes configured for Wordmove to work with variables specified in `.env` file. You may modify the `sql_adapter` to either one of your choice, but `wpcli` should work fine in most cases and it's already configured inside the Wordmove container.

To use Wordmove, simply run:
```bash
kayak wordmove [your wordmove parameters]
```

Take a look at [Welaika's Wordmove project here](https://github.com/welaika/wordmove).

**TIP**: you can configure your movefile to accept environment variables described in `.env` using the syntax:
```
<%= ENV['YOUR_ENV_VAR_NAME'] %>
```

## Database dump
you can dump the database anytime you want with a line: 
```
kayak dump > dump.sql
```

## Share your local WordPress with others
Sometimes you want to share your local WordPress install with a collegue or a client to let them see what you're working on. Meet kayak serve.
```
kayak serve
```
kayak uses ngrok.io to create a tunnel and a WordPress plugin (relative-url) to make everything work. 
When you stop ngrok (CTRL-C), kayak deactivates relative-url plugin to let you work as usual.

## Credits
Kayak is heavily based on [Chris Fidao](https://github.com/fideloper) [Vessel](https://github.com/shipping-docker/vessel)

