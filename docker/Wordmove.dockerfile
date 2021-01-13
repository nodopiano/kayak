FROM welaika/wordmove:latest

RUN apt-get update && apt-get install -y php-xml
