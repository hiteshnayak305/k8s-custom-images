ARG VERSION=16.4.0-debian-12-r14
ARG PGVECTO_RS_VERSION=pg16-v0.3.0-amd64
#latest

# Binary Image
FROM tensorchord/pgvecto-rs-binary:$PGVECTO_RS_VERSION AS binary

# Final Image Build
FROM bitnami/postgresql:$VERSION

# Information
LABEL org.opencontainers.image.authors="hiteshnayak305@gmail.com"
LABEL version="1.0.0"
LABEL description="This is a customized promtail to be deployed in local kubernetes lab."

USER root

# Install pgvecto.rs binary
ENV POSTGRESQL_SHARED_PRELOAD_LIBRARIES="pgaudit,vectors.so"
#ENV POSTGRESQL_EXTRA_FLAGS=""
COPY --from=binary /pgvecto-rs-binary-release.deb /tmp/vectors.deb
RUN apt-get --no-install-recommends install -y /tmp/vectors.deb && \
    rm -f /tmp/vectors.deb && \
    mv /usr/lib/postgresql/16/lib/vectors.so /opt/bitnami/postgresql/lib/ && \
    mv /usr/share/postgresql/16/extension/vector* /opt/bitnami/postgresql/share/extension/

USER 1001
