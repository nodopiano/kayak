FROM php:7.1-apache

ARG VOLUME
ARG HOST_GUID
 
# Install requirements for wp-cli support
RUN apt-get update \
        && apt-get install -y --no-install-recommends git vim zip sudo less \
        mysql-client libjpeg-dev libpng12-dev \
        libmemcached-dev zlib1g-dev \
        zip unzip \
        rsync openssh-client \
        && rm -rf /var/lib/apt/lists/* \
    	&& docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
	    && docker-php-ext-install gd mysqli opcache zip \
        && pecl install memcached-3.0.3 \
		&& pecl install -o -f redis \
        &&  rm -rf /tmp/pear \
        && docker-php-ext-enable memcached \
        &&  docker-php-ext-enable redis


RUN php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer
# Add WP-CLI
RUN curl -o /bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x /bin/wp
RUN groupmod -o -g ${HOST_GUID} www-data && usermod -o -u ${HOST_GUID} www-data

#COPY tools/perms.sh /usr/local/bin/perms
#COPY tools/permission_fix.sh /usr/local/bin/permission_fix
