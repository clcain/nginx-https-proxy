from debian:stretch-slim

RUN apt-get update && apt-get install -y certbot curl nginx && apt-get clean

COPY sites-enabled/* /etc/nginx/sites-enabled/
COPY nginx.conf /etc/nginx/

RUN mkdir /var/www/letsencrypt

CMD ["nginx", "-g", "daemon off;"]
