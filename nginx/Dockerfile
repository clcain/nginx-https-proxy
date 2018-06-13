from debian:stretch-slim

RUN apt-get update && apt-get install -y certbot cron curl nginx && apt-get clean

COPY sites-enabled/* /etc/nginx/sites-enabled/
COPY nginx.conf /etc/nginx/

RUN mkdir /var/www/letsencrypt

CMD bash -c "service cron start && nginx -g 'daemon off;'"
