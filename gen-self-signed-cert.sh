#!/bin/bash

if [ -z $1 ]
then
    echo "Usage: bash gen-self-signed-cert.sh [domain name]"
    exit 1
fi

sudo mkdir -p letsencrypt/live/$1/

sudo openssl req -x509 -newkey rsa:4096 \
    -keyout letsencrypt/live/$1/privkey.pem \
    -out letsencrypt/live/$1/fullchain.pem \
    -days 365 -nodes -subj "/CN=$1"
