ARG VERSION=latest
FROM <repo>/<name>:$VERSION

# Information
LABEL org.opencontainers.image.authors="hiteshnayak305@gmail.com"
LABEL version="1.0.0"
LABEL description="This is a customized <NAME> Image to be deployed in local kubernetes lab."

# Install custom Root CA Certificate
COPY common/custom.crt /usr/local/share/ca-certificates/
RUN update-ca-certificates