ARG VERSION=latest
FROM grafana/promtail:$VERSION

# Information
LABEL org.opencontainers.image.authors="hiteshnayak305@gmail.com"
LABEL version="1.0.0"
LABEL description="This is a customized promtail to be deployed in local kubernetes lab."

# Install custom Root CA Certificate
COPY common/custom.crt /usr/local/share/ca-certificates/
RUN update-ca-certificates
