# Generate latest ca-certificates
FROM debian:bullseye-slim AS certs
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && \
    apt --no-install-recommends install -y ca-certificates --option=Dpkg::Options::=--force-confdef && \
    apt clean
COPY common/custom.crt /usr/local/share/ca-certificates/
RUN update-ca-certificates

# build actual image
ARG VERSION=latest
FROM gcr.io/kaniko-project/executor:$VERSION

# Information
LABEL org.opencontainers.image.authors="hiteshnayak305@gmail.com"
LABEL version="1.0.0"
LABEL description="This is a customized Kaniko Image to be deployed in local kubernetes lab."

# Install custom Root CA Certificate
COPY --from=certs /etc/ssl/certs/ca-certificates.crt /kaniko/ssl/certs/
