# Generate latest ca-certificates
FROM debian:bullseye-slim AS certs
RUN apt update && apt install -y ca-certificates
COPY common/custom.crt /usr/local/share/ca-certificates/
RUN update-ca-certificates

# build actual image
FROM gcr.io/kaniko-project/executor:debug

# Information
LABEL org.opencontainers.image.authors="hiteshnayak305@gmail.com"
LABEL version="1.0.0"
LABEL description="This is a customized Kaniko Image to be deployed in local kubernetes lab."

# Install custom Root CA Certificate
COPY --from=certs /etc/ssl/certs/ca-certificates.crt /kaniko/ssl/certs/
