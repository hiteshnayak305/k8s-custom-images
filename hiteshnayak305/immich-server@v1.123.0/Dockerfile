ARG VERSION=main
FROM ghcr.io/immich-app/immich-server:$VERSION

# Information
LABEL org.opencontainers.image.authors="hiteshnayak305@gmail.com"
LABEL version="1.0.0"
LABEL description="This is a customized node agent Image to be deployed in local kubernetes lab."

# Install custom Root CA Certificate
RUN apt update && apt -y --no-install-recommends install ca-certificates && apt clean
COPY common/custom.crt /usr/local/share/ca-certificates/
RUN update-ca-certificates
