FROM wordpress:php8.1

ARG VOLUME
ARG HOST_GUID

COPY --from=composer/composer:latest-bin /composer /usr/bin/composer
# Install requirements for wp-cli support
RUN apt-get update \
        && apt-get install -y sudo less mariadb-client \
        && rm -rf /var/lib/apt/lists/*

# Add WP-CLI
RUN curl -o /bin/wp-cli.phar https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
COPY tools/wpcli.sh /bin/wp
COPY tools/install_wp.sh /bin/install_wp
RUN chmod +x /bin/wp-cli.phar
RUN groupmod -o -g ${HOST_GUID} www-data
RUN usermod -o -u ${HOST_GUID} www-data
RUN chown -R www-data:www-data /usr/src/wordpress

COPY tools/chown-separated-folders.sh /usr/local/bin/

ENTRYPOINT ["chown-separated-folders.sh"]
CMD ["apache2-foreground"]

#COPY tools/perms.sh /usr/local/bin/perms
#COPY tools/permission_fix.sh /usr/local/bin/permission_fix
