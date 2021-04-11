# nginx-https-proxy

Easily secure multiple local HTTP applications with HTTPS using this nginx configuration that can be deployed using Docker. Supports automatic certificate generation from Let's Encrypt.

Must have Docker and docker-compose installed to use.

## Installation

Clone this repository and run `./start.sh`.

## Let's Encrypt

Once the Docker container is running, use the helper script to automatically generate a Let's Encrypt certificate for your domain.

Ensure that your domain name is set up to resolve to this machine's IP address. Let's Encrypt will attempt to connect to your domain using HTTP and must be able to connect to the Docker container running on this machine.

```
./gen-cert.sh [your domain name]
```

## Self signed certificates

If you want to use a self signed certficate instead of Let's Encrypt, use `./gen-self-signed-cert.sh` to generate one.

```
./gen-self-signed-cert.sh [domain name]
```

## Proxy configuration

Ensure that you have followed the instructions above for each domain that you want to secure with HTTPS before continuing. The certificate files should appear in `./letsencrypt/live/`.

For each site that you want to secure with HTTPS, copy the [example configuration file](sites-enabled/.example.com.conf) from `sites-enabled` to a new file in the same directory. Edit the certificate location to match your domain name. Then, run `docker-compose restart`.
