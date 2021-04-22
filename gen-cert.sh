#!/bin/bash

if [ -z $1 ]
then
    echo "Usage: bash gen-cert.sh [domain name]"
    exit 1
fi

docker exec -ti nginx-https-proxy_app_1 certbot certonly --nginx --no-redirect -d $1
