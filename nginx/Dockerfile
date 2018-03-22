from debian:stretch

RUN apt-get update && apt-get install nginx -y
RUN apt-get update && apt-get install curl vim -y
RUN apt-get update && apt-get install certbot -y

COPY sites-enabled/* /etc/nginx/sites-enabled/
COPY nginx.conf /etc/nginx/

RUN mkdir /var/www/letsencrypt

CMD ["nginx", "-g", "daemon off;"]
