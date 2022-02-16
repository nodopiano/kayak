FROM welaika/wordmove:php7

RUN apt-get update && apt-get install -y sudo
RUN usermod -aG sudo www-data
RUN echo "ALL ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/no-password-need

RUN apt-get update && apt-get install -y php7.4-xml

COPY .lftprc ~/.lftprc
RUN mkdir -p /tmp/.ssh
RUN chmod +777 /tmp

COPY ./wordmove-entry.sh /bin/wordmove-entry.sh
RUN chmod +x /bin/wordmove-entry.sh

ENTRYPOINT ["/bin/wordmove-entry.sh"]
