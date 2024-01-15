# Certificates

## Lets Encrypt

Renewing SSL certificates (Expires every 90 days)

```bash
#/usr/bin/env bash

export CLOUDFLARE_DNS_API_TOKEN=XXXXXXXX

lego \ 
--email email@domain.com \ 
--dns cloudflare \ 
--domains "domain.com" \ 
--domains "*.domain.com" \ 
--domains "*.dev.domain.com" run

ls .lego/certificates/
```

Copy *.crt and *.key to Caddy, HAProxy, Nginx config directory.

[lego](https://go-acme.github.io/lego/)

## Creating pem file for haproxy

```bash
cat domain.com.crt domain.com.key > combined.pem
```
