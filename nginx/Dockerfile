FROM debian:bookworm-slim

RUN apt update && apt install -y cron curl nginx python3-certbot-nginx && apt-get clean

RUN mkdir /var/www/letsencrypt

COPY nginx.conf /etc/nginx/

CMD bash -c "service cron start && nginx -g 'daemon off;'"
