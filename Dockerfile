FROM wordpress

ARG VOLUME
ARG DOCKER_USER
ARG DOCKER_GROUP
ARG HOST_USER_ID
ARG HOST_GROUP_ID
 

# Install requirements for wp-cli support
RUN apt-get update \
        && apt-get install -y sudo less mysql-client \
        && rm -rf /var/lib/apt/lists/*

# Add WP-CLI 
RUN curl -o /bin/wp-cli.phar https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
COPY tools/wpcli.sh /bin/wp
COPY tools/install_wp.sh /bin/install_wp
RUN chmod +x /bin/wp-cli.phar

COPY tools/perms.sh /usr/local/bin/perms
COPY tools/permission_fix.sh /usr/local/bin/permission_fix