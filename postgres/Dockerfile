FROM postgres:18.0

# Set environment variables for the extensions' versions/paths
ENV POSTGIS_VERSION="3.5" \
    VECTORCHORD_VERSION="0.5.3" \
    PG_MAJOR="18"

# ----------------------------------------------------------------------
# LAYER 1: Install PostGIS
# ----------------------------------------------------------------------
RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends postgresql-${PG_MAJOR}-postgis-${POSTGIS_VERSION%.*}; \
    rm -rf /var/lib/apt/lists/*;

# ----------------------------------------------------------------------
# LAYER 2: Install VectorChord (including temp tools and cleanup)
# ----------------------------------------------------------------------
RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends wget ca-certificates postgresql-${PG_MAJOR}-pgvector; \
    ARCH=$(dpkg --print-architecture); \
    VECTORCHORD_DEB="postgresql-${PG_MAJOR}-vchord_${VECTORCHORD_VERSION}-1_${ARCH}.deb"; \
    wget -O /tmp/vchord.deb "https://github.com/tensorchord/VectorChord/releases/download/${VECTORCHORD_VERSION}/${VECTORCHORD_DEB}"; \
    dpkg -i /tmp/vchord.deb; \
    CONFIG_FILE="/usr/share/postgresql/${PG_MAJOR}/postgresql.conf.sample"; \
    sed -i "s/^#*shared_preload_libraries = '.*'/shared_preload_libraries = 'vchord'/g" "${CONFIG_FILE}"; \
    rm /tmp/vchord.deb; \
    apt-get purge -y --auto-remove wget ca-certificates; \
    rm -rf /var/lib/apt/lists/*;

# ----------------------------------------------------------------------
# LAYER 3: Initialization Script
# ----------------------------------------------------------------------
COPY init-extensions.sh /docker-entrypoint-initdb.d/
