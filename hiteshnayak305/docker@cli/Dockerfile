ARG VERSION=cli
FROM docker:$VERSION

# Information
LABEL org.opencontainers.image.authors="hiteshnayak305@gmail.com"
LABEL version="1.0.0"
LABEL description="This is a customized docker cli tool Image to be deployed in local kubernetes lab."

# Environment Variables
ENV BUILDKIT_HOST=127.0.0.1
ENV BUILDKIT_PORT=1234

# Install custom Root CA Certificate
COPY common/custom.crt /usr/local/share/ca-certificates/
RUN update-ca-certificates

# Install entrypoint script
COPY common/docker/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
CMD [ "/bin/sh" ]

# Healthcheck
COPY common/docker/healthcheck.sh /usr/local/bin/healthcheck.sh
RUN chmod +x /usr/local/bin/healthcheck.sh
HEALTHCHECK --interval=10s --timeout=3s --start-period=10s --retries=3 CMD [ "/usr/local/bin/healthcheck.sh" ]
