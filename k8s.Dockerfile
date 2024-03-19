FROM alpine/k8s:1.29.2

# Information
LABEL org.opencontainers.image.authors="hiteshnayak305@gmail.com"
LABEL version="1.0.0"
LABEL description="This is a customized k8s tools Image to be deployed in local kubernetes lab."

# Install custom Root CA Certificate
COPY common/custom.crt /usr/local/share/ca-certificates/
RUN chmod 0644 /usr/local/share/ca-certificates/custom.crt && \
    update-ca-certificates
