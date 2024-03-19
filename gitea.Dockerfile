FROM gitea/gitea:1.21.7-rootless

# Information
LABEL org.opencontainers.image.authors="hiteshnayak305@gmail.com"
LABEL version="1.0.0"
LABEL description="This is a customized Gitea Image to be deployed in local kubernetes lab."

# Install custom Root CA Certificate
USER root
COPY common/custom.crt /usr/local/share/ca-certificates/
RUN chmod 0644 /usr/local/share/ca-certificates/custom.crt && \
    update-ca-certificates
USER 1000:1000
