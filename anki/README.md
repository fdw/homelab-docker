# Anki Sync Server
A Dockerfile for the [Anki Sync Server](https://github.com/ankitects/anki) that allows you to synchronize your Anki decks across devices using your own server.

## Usage
You can get started creating a container from this image using either docker-compose or the docker CLI.

### Docker CLI

```bash
docker run -d \
    --name=anki-sync-server \
    -v anki_data:/anki_data \
    -p 8080:8080 \
    --restart unless-stopped \
    ghcr.io/fdw/anki
```

### Docker Compose

```yml
version: "3.0"
services:
  anki-sync-server:
    container_name: anki-sync-server
    image: ghcr.io/fdw/anki
    ports:
      - 8080:8080
    volumes:
      - anki_data:/anki_data
    restart: unless-stopped

volumes:
  anki_data:
```

## Environment Variables

| Parameter     | Value                                                      |
|---------------|-----------------------------------------------------------|
| `SYNC_PORT`   | The port on which the sync server listens. Default: 8080  |
| `SYNC_BASE`   | The path where Anki data is stored. Default: /anki_data   |

## Client Configuration

To connect your Anki clients to your self-hosted sync server:

1. In Anki desktop client, go to Tools → Preferences → Network
2. Enable "Custom sync server" 
3. Set the sync server URL to `http://your-server-ip:8080`
4. Restart Anki
