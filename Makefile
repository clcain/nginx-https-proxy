up:
	docker-compose up --build -d

down:
	docker-compose down

logs:
	docker-compose logs -f

shell:
	docker exec -ti nginx-https-proxy-nginx-1 bash

cert: up
	@if [ -z "$$domain" ]; then echo "Usage: make cert domain=[your domain name]"; exit 1; fi
	docker exec -ti nginx-https-proxy-nginx-1 certbot certonly --nginx --no-redirect -d $$domain

self-signed-cert:
	@if [ -z "$$domain" ]; then echo "Usage: make self-signed-cert domain=[your domain name]"; exit 1; fi
	@if [ "$$USER" != "root" ]; then echo "Error: Must be run as root."; exit 1; fi
	mkdir -p ./letsencrypt/live/$$domain/
	openssl req -x509 -newkey rsa:4096 \
		-subj "/CN=$$domain" \
    	-out ./letsencrypt/live/$$domain/fullchain.pem \
    	-keyout ./letsencrypt/live/$$domain/privkey.pem \
    	-days 365 \
		-nodes
