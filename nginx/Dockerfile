FROM debian:stretch-slim

RUN apt-get update && apt-get install -y cron curl nginx python-certbot-nginx && apt-get clean

RUN mkdir /var/www/letsencrypt

COPY nginx.conf /etc/nginx/
COPY sites-enabled/* /etc/nginx/sites-enabled/

CMD bash -c "service cron start && nginx -g 'daemon off;'"
