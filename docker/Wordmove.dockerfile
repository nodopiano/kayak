FROM welaika/wordmove:php7

RUN apt-get update && apt-get install -y php-xml
