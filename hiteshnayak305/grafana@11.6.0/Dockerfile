ARG VERSION=latest
FROM grafana/grafana:$VERSION

# Information
LABEL org.opencontainers.image.authors="hiteshnayak305@gmail.com"
LABEL version="1.0.0"
LABEL description="This is a customized Grafana to be deployed in local kubernetes lab."

# Install custom Root CA Certificate
USER root
COPY common/custom.crt /usr/local/share/ca-certificates/
RUN update-ca-certificates
USER 472
