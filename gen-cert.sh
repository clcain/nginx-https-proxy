#!/bin/bash

docker exec -ti nginx-https-proxy_app_1 certbot certonly --webroot -w /var/www/letsencrypt/ -d $1
