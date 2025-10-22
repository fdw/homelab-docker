#!/bin/bash
set -e

# Run SQL commands as the superuser on the default database
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    -- Enable PostGIS
    CREATE EXTENSION IF NOT EXISTS postgis;

    -- Enable pgvector (provides the 'vector' data type)
    CREATE EXTENSION IF NOT EXISTS vector;

    -- Enable VectorChord (uses the 'vector' data type)
    CREATE EXTENSION IF NOT EXISTS vchord;
EOSQL
