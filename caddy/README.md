# Caddy
A Dockerfile for [Caddy](https://caddyserver.com/) with the [docker-proxy plugin](https://github.com/lucaslorentz/caddy-docker-proxy) and [deSEC DNS provider](https://github.com/caddy-dns/desec) for automatic HTTPS.

## Usage
You can get started creating a container from this image using either docker-compose or the docker cli.

### Docker CLI

```bash
docker run -d \
    --name=caddy \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v caddy_data:/data \
    -v caddy_config:/config \
    -p 80:80 \
    -p 443:443 \
    --restart unless-stopped \
    ghcr.io/fdw/caddy
```

### Docker Compose

```yml
version: "3.0"
services:
  caddy:
    container_name: caddy
    image: ghcr.io/fdw/caddy
    ports:
      - 80:80
      - 443:443
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - caddy_data:/data
      - caddy_config:/config
    restart: unless-stopped

volumes:
  caddy_data:
  caddy_config:
```

## Environment Variables

| Parameter                | Value                                                                                          |
|--------------------------|------------------------------------------------------------------------------------------------|
| `CADDY_INGRESS_NETWORKS` | (Optional) Comma-separated list of Docker networks that Caddy should listen for service labels |

## Usage with Docker Labels

This Caddy image comes with the docker-proxy plugin which allows you to configure Caddy using Docker container labels. Here's an example:

```yml
services:
  webapp:
    image: your-webapp
    labels:
      caddy: example.com
      caddy.reverse_proxy: "{{upstreams 8080}}"
```

## Features

- **docker-proxy plugin**: Automatically configure Caddy using Docker container labels
- **deSEC DNS provider**: Allows Caddy to use deSEC for DNS-01 ACME challenges