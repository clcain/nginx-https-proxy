# nginx-https-proxy

This software is an nginx HTTPS reverse proxy with support for Let's Encrypt. It may be deployed using Docker. It is a container that has nginx and the Let's Encrypt certbot installed. It may be used to automatically obtain an HTTPS certificate from Let's Encrypt, then act as a reverse proxy for upgrading an HTTP service to HTTPS.

## Installation

To start using this software, clone this repository and then run `docker-compose up`. Then, follow the instructions in the next two sections to get an HTTPS certificate set up and to configure the redirect for your domain.

## Obtaining new certificates from Let's Encrypt
```
certbot certonly --webroot -w /var/www/letsencrypt/ -d example.com
```

This command may be run on the host machine through `docker exec` as follows:
```
docker exec -ti nginxhttpsproxy_app_1 certbot certonly --webroot -w /var/www/letsencrypt/ -d example.com
```

## Configuration

You will want to obtain the certificate from Let's Encrypt using the command above before adding your site's configuration.

To set up the HTTPS reverse proxy for your site, copy the [example configuration file](nginx-proxy/sites/enabled/.example.com) from `nginx-proxy/sites/enabled` to a new file in the same directory. Edit the certificate location to match your domain name.

## Scheduled restarts

You may want to schedule a restart of the nginx container periodically (once per month is recommended) so that nginx will load the lastest certificates. You can use cron to schedule a job like the following:

```
0 0 1 * * docker restart nginxhttpsproxy_app_1
```

## Notes

If you want to generate your own SSL key for testing, you can do so with OpenSSL. You must rename the files accordingly.
```
openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365 -nodes -subj '/CN=example.com'
```
