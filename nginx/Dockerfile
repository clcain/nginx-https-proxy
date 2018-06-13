from debian:stretch-slim

RUN apt-get update && apt-get install -y certbot cron curl nginx && apt-get clean

COPY sites-enabled/* /etc/nginx/sites-enabled/
COPY nginx.conf /etc/nginx/

RUN mkdir /var/www/letsencrypt

COPY cron.d/certbot /etc/cron.d/certbot
RUN chmod 0644 /etc/cron.d/certbot

CMD ["nginx", "-g", "daemon off;"]
