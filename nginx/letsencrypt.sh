#!/bin/bash

while read domain; do
    certbot certonly --webroot -w /var/www/letsencrypt/ -d $domain
done < domains.txt
