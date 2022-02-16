#!/usr/bin/env bash
set -e

# Creo utente con id impostato in docker-compose
mkdir -p /home/wordmove-user/.ssh
useradd \
    --uid $USER_UID \
    -G www-data \
    --shell /bin/bash \
    -d /home/wordmove-user \
    wordmove-user

if [[ -d /tmp/.ssh ]]; then
    cp -R /tmp/.ssh /home/wordmove-user/
    chown -R wordmove-user:wordmove-user /home/wordmove-user
    chmod 400 -R /home/wordmove-user/.ssh
    sudo -u wordmove-user chmod u+xr,go-rwx /home/wordmove-user/.ssh
fi

su - wordmove-user 
