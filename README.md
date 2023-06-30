# nginx-https-proxy

Easily secure multiple local HTTP applications with HTTPS using this nginx configuration that can be deployed using Docker. Supports automatic certificate generation from Let's Encrypt.

Must have Docker, docker-compose, and Make installed to use.

## Installation

Clone this repository and run `make up`.

## Let's Encrypt

Once the Docker container is running, use the helper script to automatically obtain a Let's Encrypt certificate for your domain.

Ensure that your domain name is set up to resolve to this machine's IP address. Let's Encrypt will attempt to connect to your domain using HTTP and must be able to connect to the Docker container running on this machine.

```
make cert domain=[your domain name]
```

### Self signed certificates

You may also use a self signed certficate instead of obtaining one from Let's Encrypt.

```
make self-signed-cert domain=[your domain name]
```

## Proxy configuration

Ensure that you have followed the instructions above for each domain that you want to secure with HTTPS before continuing.

For each site that you want to secure with HTTPS, copy the [example configuration file](sites-enabled/.example.com.conf) from `sites-enabled` to a new file in the same directory. Name the file to match your domain name. Then edit the configuration to match d local port number. Then, run `make restart`.
