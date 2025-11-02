# Docker Images Collection
This repository contains Docker images my own, personal use. If it's useful for you, feel free to pull them, but I make not guarantees for updates, maintenance or availabilty.

## Available Images

| Image                                                                                    | Description                                                                                                                                                                                                                                   | README                                   |
|------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------|
| [ghcr.io/fdw/anki](https://github.com/users/fdw/packages/container/package/anki)         | A Dockerfile for the [Anki Sync Server](https://github.com/ankitects/anki) that allows you to synchronize your Anki decks across devices using your own server.                                                                               | [anki/README.md](anki/README.md)         |
| [ghcr.io/fdw/caddy](https://github.com/users/fdw/packages/container/package/caddy)       | [Caddy](https://caddyserver.com/) with the [docker-proxy plugin](https://github.com/lucaslorentz/caddy-docker-proxy) and [deSEC DNS provider](https://github.com/caddy-dns/desec) for automatic HTTPS.                                        | [caddy/README.md](caddy/README.md)       |
| [ghcr.io/fdw/fava](https://github.com/users/fdw/packages/container/package/fava)         | A Dockerfile for [beancount-fava](https://github.com/beancount/fava), the web UI for [beancount](https://github.com/beancount/beancount). Also includes [fava-portfolio-returns](https://github.com/andreasgerstmayr/fava-portfolio-returns). | [fava/README.md](fava/README.md)         |
| [ghcr.io/fdw/postgres](https://github.com/users/fdw/packages/container/package/postgres) | PostgreSQL 18 with [PostGIS](https://postgis.net/), [pgvector](https://github.com/pgvector/pgvector), and [VectorChord](https://github.com/tensorchord/VectorChord) extensions pre-installed.                                                 | [postgres/README.md](postgres/README.md) |

## Tags
All images are tagged with:
- `latest` - The most recent build from the main branch
- Date-based tags (e.g., `2025-10-22`) - Images built on a specific date