FROM wordpress:php7.2

ARG VOLUME
ARG HOST_GUID
 
# Install requirements for wp-cli support
RUN apt-get update \
        && apt-get install -y sudo less mysql-client \
        && rm -rf /var/lib/apt/lists/*

# Add WP-CLI 
RUN curl -o /bin/wp-cli.phar https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
COPY tools/wpcli.sh /bin/wp
COPY tools/install_wp.sh /bin/install_wp
RUN chmod +x /bin/wp-cli.phar
RUN groupmod -o -g ${HOST_GUID} www-data
RUN usermod -o -u ${HOST_GUID} www-data
RUN chown -R www-data:www-data /usr/src/wordpress

# Add Wordmove support
RUN \
  apt-get update && apt-get install -y --no-install-recommends --no-install-suggests curl bzip2 build-essential libssl-dev libreadline-dev zlib1g-dev && \
  rm -rf /var/lib/apt/lists/* && \
  curl -L https://github.com/sstephenson/ruby-build/archive/v20180329.tar.gz | tar -zxvf - -C /tmp/ && \
  cd /tmp/ruby-build-* && ./install.sh && cd / && \
  ruby-build -v 2.5.1 /usr/local && rm -rfv /tmp/ruby-build-* && \
  gem install bundler --no-rdoc --no-ri

RUN gem install wordmove

COPY tools/wordmove.sh /bin/wmove
#COPY tools/perms.sh /usr/local/bin/perms
#COPY tools/permission_fix.sh /usr/local/bin/permission_fix
