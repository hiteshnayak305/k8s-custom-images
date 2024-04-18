ARG VERSION=latest
FROM ubuntu:$VERSION

# Information
LABEL org.opencontainers.image.authors="hiteshnayak305@gmail.com"
LABEL version="1.0.0"
LABEL description="This is a customized ubuntu debug Image to be deployed in local kubernetes lab."

# Install custom Root CA Certificate
RUN apt update && apt -y --no-install-recommends install ca-certificates && apt clean
COPY common/custom.crt /usr/local/share/ca-certificates/
RUN update-ca-certificates

# Install tools
RUN apt -y --no-install-recommends install dnsutils \
    htop \
    net-tools \
    nano \
    wget \
    curl \
    && apt clean
