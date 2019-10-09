#!/bin/bash

docker exec -ti nginx-https-proxy_app_1 certbot --nginx --no-redirect -d $1
