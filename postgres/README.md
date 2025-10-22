# Postgres Docker Image
A Dockerfile for PostgreSQL 18 with [PostGIS](https://postgis.net/), [pgvector](https://github.com/pgvector/pgvector), and [VectorChord](https://github.com/tensorchord/VectorChord) extensions pre-installed.

## Usage
It's based on the official Postgres Docker image, so everything from there should work here, too.

### Docker CLI

```bash
docker run -d \
    --name=postgres \
    -v postgres_data:/var/lib/postgresql/data \
    -e POSTGRES_PASSWORD=yourpassword \
    -p 5432:5432 \
    --restart unless-stopped \
    ghcr.io/fdw/postgres
```

### Docker Compose

```yml
version: "3.0"
services:
  postgres:
    container_name: postgres
    image: ghcr.io/fdw/postgres
    ports:
      - 5432:5432
    environment:
      - POSTGRES_PASSWORD=<pass>
    volumes:
      - postgres_data:/var/lib/postgresql/data
    restart: unless-stopped

volumes:
  postgres_data:
```

## Environment Variables

| Parameter           | Value                                                             |
|---------------------|-------------------------------------------------------------------|
| `POSTGRES_PASSWORD` | Required password for the PostgreSQL instance                     |
| `POSTGRES_USER`     | Optional username for the PostgreSQL instance (default: postgres) |
| `POSTGRES_DB`       | Optional database name to create on startup (default: postgres)   |

## Pre-installed Extensions
The following extensions are automatically enabled in the database at initialization:

- **PostGIS**: Adds support for geographic objects to PostgreSQL
- **pgvector**: Adds vector data type and similarity search functionality
- **VectorChord**: Provides optimized vector operations and indexing on top of pgvector